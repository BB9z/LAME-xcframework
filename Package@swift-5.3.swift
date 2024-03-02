// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LAME",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_13),
        .tvOS(.v12),
        .watchOS(.v4),
    ],
    products: [
        .library(name: "LAME", targets: ["LAME"])
    ],
    dependencies: [],
    targets: [
//        .binaryTarget(
//            name: "LAME",
//            path: "macosx/LAME.xcframework"
//        ),
        .binaryTarget(
            name: "LAME",
            url: "https://github.com/BB9z/LAME-xcframework/releases/download/3.100.1/LAME.xcframework.zip",
            checksum: "9f1106a7ace15bcdb40106e6e5c7edbd77aa68569e7c4537c50bb566b29973e5"
        )
    ]
)
