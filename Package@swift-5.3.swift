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
            url: "https://github.com/BB9z/LAME-xcframework/releases/download/3.100.3/LAME.xcframework.zip",
            checksum: "bcc33a8311c80993a06d363a29f631d74420cf954be8e8ee9e13450a525944ab"
        )
    ]
)
