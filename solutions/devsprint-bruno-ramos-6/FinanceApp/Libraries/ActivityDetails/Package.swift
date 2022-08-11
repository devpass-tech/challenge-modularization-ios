// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ActivityDetails",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "ActivityDetails",
            targets: ["ActivityDetails"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ActivityDetails",
            dependencies: []),
        .testTarget(
            name: "ActivityDetailsTests",
            dependencies: ["ActivityDetails"]),
    ]
)
