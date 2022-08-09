// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Modules",
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
