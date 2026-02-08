import SwiftUI

// Defines the visual style of a toast (color + icon)
public enum ToastStyle {
    case success, error, warning, info
    
    // Background color associated with each toast style
    var backgroundColor: Color {
        switch self {
        case .success: return Color.green.opacity(0.9)     // Green for success messages
        case .error: return Color.red.opacity(0.9)         // Red for errors
        case .warning: return Color.orange.opacity(0.95)   // Orange for warnings
        case .info: return Color.black.opacity(0.85)       // Neutral dark for general info
        }
    }
    
    // SF Symbol icon associated with each toast style
    var icon: String {
        switch self {
        case .success: return "checkmark.circle.fill"          // Success checkmark
        case .error: return "xmark.octagon.fill"               // Error symbol
        case .warning: return "exclamationmark.triangle.fill"  // Warning triangle
        case .info: return "info.circle.fill"                  // Info symbol
        }
    }
}

// Controls where the toast appears on screen
public enum ToastPosition {
    case top, center, bottom
}

// Model representing a single toast notification
public struct ToastItem: Identifiable, Equatable {
    // Unique identifier so SwiftUI can track each toast separately
    public let id = UUID()
    
    // Text message displayed in the toast
    let message: String
    
    // Visual style (color + icon)
    let style: ToastStyle
    
    // How long the toast stays visible before dismissing
    let duration: TimeInterval
    
    // Screen position where the toast should appear
    let position: ToastPosition
}

// Manages toast queue and presentation logic
@MainActor
public final class ToastManager: ObservableObject {
    
    // Queue of pending toast messages waiting to be shown
    @Published var queue: [ToastItem] = []
    
    // Currently visible toast (nil when none is displayed)
    @Published var current: ToastItem?
    
    public init() {}
    
    /// Adds a new toast to the queue and triggers display if possible
    public func show(
        message: String,
        style: ToastStyle = .info,
        duration: TimeInterval = 2.0,
        position: ToastPosition = .bottom
    ) {
        // Create a new toast item
        let toast = ToastItem(message: message, style: style, duration: duration, position: position)
        
        // Add it to the queue
        queue.append(toast)
        
        // Try to display immediately if no toast is currently shown
        displayNextIfNeeded()
    }
    
    /// Displays the next toast in the queue if nothing is currently visible
    private func displayNextIfNeeded() {
        // Only proceed if there is no active toast and queue is not empty
        guard current == nil, !queue.isEmpty else { return }
        
        // Take the first toast from the queue
        current = queue.removeFirst()
        
        // Automatically dismiss after its duration
        DispatchQueue.main.asyncAfter(deadline: .now() + (current?.duration ?? 2)) {
            withAnimation {
                self.current = nil // Hide current toast
            }
            
            // Recursively try to show the next toast in the queue
            self.displayNextIfNeeded()
        }
    }
}
