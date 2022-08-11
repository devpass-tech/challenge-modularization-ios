// swift-tools-version:5.5

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
