import SwiftUI

// A reusable view that renders a single toast notification
struct ToastView: View {
    
    // The data model describing what the toast should display
    let item: ToastItem
    
    var body: some View {
        // Horizontal layout for icon + message
        HStack(spacing: 10) {
            
            // Icon based on toast style (success, error, etc.)
            Image(systemName: item.style.icon)
                .foregroundColor(.white) // White icon for contrast
            
            // Toast message text
            Text(item.message)
                .foregroundColor(.white)      // White text for readability
                .font(.subheadline)          // Slightly smaller system font
                .multilineTextAlignment(.leading) // Align multi-line text to the left
        }
        .padding(.horizontal, 16) // Inner horizontal spacing
        .padding(.vertical, 12)   // Inner vertical spacing
        .background(item.style.backgroundColor) // Background color based on style
        .cornerRadius(14) // Rounded corners for a modern toast look
        .shadow(radius: 4) // Subtle shadow to lift it off the background
        .padding(.horizontal, 20) // Outer margin from screen edges
    }
}
