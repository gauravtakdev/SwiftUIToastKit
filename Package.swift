// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIToastKit",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SwiftUIToastKit",
            targets: ["SwiftUIToastKit"]
        )
    ],
    targets: [
        .target(
            name: "SwiftUIToastKit",
            dependencies: []
        )
    ]
)
