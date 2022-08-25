// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Sample",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "Sample",
            targets: [
                "SampleData",
                "SampleDomain",
                "SampleUI"
            ]),
    ],
    dependencies: [
        .package(path: "//Network"),
    ],
    targets: [
        .target(
            name: "SampleDomain",
            dependencies: []
        ),
        .testTarget(
            name: "SampleDomainTests",
            dependencies: ["SampleDomain"]
        ),
        .target(
            name: "SampleData",
            dependencies: [
                "SampleDomain",
                "Network"
            ]
        ),
        .testTarget(
            name: "SampleDataTests",
            dependencies: ["SampleData"]
        ),
        .target(
            name: "SampleUI",
            dependencies: [
                "SampleDomain"
            ]
        ),
        .testTarget(
            name: "SampleUITests",
            dependencies: ["SampleUI"]
        ),
    ]
)
