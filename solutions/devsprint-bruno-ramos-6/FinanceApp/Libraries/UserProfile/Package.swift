// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UserProfile",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "UserProfile",
            targets: ["UserProfile"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UserProfile",
            dependencies: []),
        .testTarget(
            name: "UserProfileTests",
            dependencies: ["UserProfile"]),
    ]
)
