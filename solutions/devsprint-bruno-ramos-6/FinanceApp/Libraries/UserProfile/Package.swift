// swift-tools-version:5.5
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
    dependencies: [
        .package(path: "../Components"),
    ],
    targets: [
        .target(
            name: "UserProfile",
            dependencies: [
                "Components"
            ]),
        .testTarget(
            name: "UserProfileTests",
            dependencies: ["UserProfile"]),
    ]
)
