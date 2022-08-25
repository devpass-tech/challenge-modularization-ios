// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Home",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Home",
            targets: ["Home"]),
    ],
    dependencies: [
        .package(path: "//Sample"),
        .package(path: "//UIComponents")
    ],
    targets: [
        .target(
            name: "Home",
            dependencies: [
                "Sample",
                "UIComponents"
            ]),
        .testTarget(
            name: "HomeTests",
            dependencies: ["Home"]),
    ]
)
