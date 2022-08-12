// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Transfer",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Transfer",
            targets: ["Transfer"]
        ),
    ],
    dependencies: [
        .package(path: "../Components")
    ],
    targets: [
        .target(
            name: "Transfer",
            dependencies: [
                "Components"
            ]
        ),
        .testTarget(
            name: "TransferTests",
            dependencies: ["Transfer"]
        ),
    ]
)
