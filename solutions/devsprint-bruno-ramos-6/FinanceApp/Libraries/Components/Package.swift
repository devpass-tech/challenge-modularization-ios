// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Components",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Components",
            targets: ["Components"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Components",
            dependencies: []),
        .testTarget(
            name: "ComponentsTests",
            dependencies: ["Components"]),
    ]
)
