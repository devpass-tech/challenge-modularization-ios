// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ContactList",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "ContactList",
            targets: ["ContactList"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ContactList",
            dependencies: []),
        .testTarget(
            name: "ContactListTests",
            dependencies: ["ContactList"]),
    ]
)
