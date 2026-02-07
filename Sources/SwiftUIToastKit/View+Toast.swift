import SwiftUI

// A ViewModifier that overlays toast notifications managed by ToastManager
public struct ToastContainer: ViewModifier {
    
    // Observes the toast manager so the UI updates when a new toast appears or disappears
    @ObservedObject var manager: ToastManager
    
    public func body(content: Content) -> some View {
        ZStack {
            // The underlying content of the screen
            content
            
            // Show a toast only if there is a currently active one
            if let toast = manager.current {
                toastView(for: toast)
                    // Animate toast entering from the correct edge with fade
                    .transition(.move(edge: edge(for: toast.position)).combined(with: .opacity))
                    .zIndex(1) // Ensure toast appears above all other content
            }
        }
        // Animate when the current toast changes (show/hide)
        .animation(.easeInOut(duration: 0.3), value: manager.current?.id)
    }
    
    // Builds the toast layout depending on its desired screen position
    @ViewBuilder
    private func toastView(for item: ToastItem) -> some View {
        VStack {
            if item.position == .top {
                // Toast at the top
                ToastView(item: item)
                Spacer()
            } else if item.position == .center {
                // Toast vertically centered
                Spacer()
                ToastView(item: item)
                Spacer()
            } else {
                // Toast at the bottom (default)
                Spacer()
                ToastView(item: item)
            }
        }
        // Add spacing from safe areas (top or bottom)
        .padding(item.position == .top ? .top : .bottom, 40)
    }
    
    // Determines from which edge the toast should animate in/out
    private func edge(for position: ToastPosition) -> Edge {
        switch position {
        case .top: return .top       // Slide from top
        case .center: return .bottom // Center toast still animates from bottom
        case .bottom: return .bottom // Slide from bottom
        }
    }
}

// Convenience extension to easily attach a ToastManager to any view hierarchy
public extension View {
    func toastManager(_ manager: ToastManager) -> some View {
        self.modifier(ToastContainer(manager: manager))
    }
}
