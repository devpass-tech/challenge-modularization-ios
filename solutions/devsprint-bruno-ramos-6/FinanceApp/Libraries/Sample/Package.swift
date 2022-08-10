// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sample",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Sample",
            targets: ["Sample"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1")),
        .package(url: "https://github.com/onevcat/Kingfisher.git", .upToNextMajor(from: "7.0.0")),
    ],
    targets: [
        .target(
            name: "Sample",
            dependencies: [
                "Alamofire",
                "Kingfisher"
            ]),
        .testTarget(
            name: "SampleTests",
            dependencies: ["Sample"]),
    ]
)
