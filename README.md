# 🍞 SwiftUIToastKit

**Lightweight, customizable toast notifications for SwiftUI apps.**

SwiftUIToastKit makes it easy to show beautiful toast messages with
support for **styles, icons, positions, animations, and queueing** ---
all built natively in SwiftUI.

 📱 See it in action: A fully working demo project showcasing all toast styles, positions, and queue behavior is available here:

👉 SwiftUIToastKit Example App
https://github.com/gauravtakdev/SwiftUIToastKitExample

------------------------------------------------------------------------

## ✨ Features

-   ✅ Pure **SwiftUI**
-   🎨 Built-in styles: **Success, Error, Warning, Info**
-   🔔 SF Symbols icons included
-   📍 Position control: **Top / Center / Bottom**
-   ⏳ Auto-dismiss with configurable duration
-   📦 Built-in **queue system** (multiple toasts display sequentially)
-   🎬 Smooth animations
-   📱 iOS 14+

------------------------------------------------------------------------

## 📦 Installation (Swift Package Manager)

In Xcode:

1.  Go to **File → Add Packages...**
2.  Enter the repository URL:

```{=html}
<!-- -->
```
    https://github.com/gauravtakdev/SwiftUIToastKit.git

3.  Choose **Up to Next Major Version**
4.  Add to your app target

------------------------------------------------------------------------

## 🚀 Quick Start

### 1️⃣ Import the package

``` swift
import SwiftUIToastKit
```

### 2️⃣ Create a ToastManager

``` swift
@StateObject private var toast = ToastManager()
```

### 3️⃣ Attach the toast container

``` swift
.toastManager(toast)
```

### 4️⃣ Show toasts

``` swift
toast.show(message: "Saved successfully!", style: .success)

toast.show(message: "Something went wrong", style: .error, position: .top)

toast.show(message: "Weak internet connection", style: .warning, position: .center)

toast.show(message: "New update available", style: .info)
```

------------------------------------------------------------------------

## 🧩 Full Example

``` swift
import SwiftUI
import SwiftUIToastKit

struct ContentView: View {
    @StateObject private var toast = ToastManager()

    var body: some View {
        VStack(spacing: 20) {
            Button("Success Toast") {
                toast.show(message: "Profile updated!", style: .success)
            }

            Button("Error Toast (Top)") {
                toast.show(message: "Something went wrong", style: .error, position: .top)
            }

            Button("Warning Toast (Center)") {
                toast.show(message: "Check your connection", style: .warning, position: .center)
            }

            Button("Queue Multiple Toasts") {
                toast.show(message: "First message")
                toast.show(message: "Second message", style: .success)
                toast.show(message: "Third message", style: .error)
            }
        }
        .padding()
        .toastManager(toast)
    }
}
```

------------------------------------------------------------------------

## 🎨 Available Styles

  ------------------------------------------------------------------------
  Style          Icon                                       Use Case
  -------------- ------------------------------------------ --------------
  success        `checkmark.circle.fill`                    Completed
                                                            actions

  error          `xmark.octagon.fill`                       Failures /
                                                            errors

  warning        `exclamationmark.triangle.fill`            Risky or
                                                            unstable
                                                            states

  info           `info.circle.fill`                         General
                                                            information
  ------------------------------------------------------------------------

------------------------------------------------------------------------

## 📍 Toast Positions

``` swift
.top
.center
.bottom
```

------------------------------------------------------------------------

## ⏱ Custom Duration

``` swift
toast.show(
    message: "This stays longer",
    style: .info,
    duration: 4.0
)
```

------------------------------------------------------------------------

## 🧠 How Queue Works

If multiple toasts are triggered quickly, SwiftUIToastKit automatically
queues them and displays one after another --- just like Android toasts.

No extra logic required ✅

------------------------------------------------------------------------

## 🔮 Roadmap

Future improvements may include:

-   Tap to dismiss\
-   Haptic feedback\
-   Custom themes & fonts\
-   Blur/glass background styles\
-   Swipe-to-dismiss gestures

------------------------------------------------------------------------

## 🤝 Contributing

Pull requests and suggestions are welcome!\
If you find a bug or have a feature request, feel free to open an issue.

------------------------------------------------------------------------

## 📄 License

MIT License.\
Feel free to use it in personal and commercial projects.

------------------------------------------------------------------------

**Made with ❤️ for SwiftUI developers**
