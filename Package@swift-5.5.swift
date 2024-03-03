// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LAME",
    platforms: [
        .iOS(.v12),
        .macCatalyst(.v13),
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
            checksum: "cc45eb59d17ec4c38f75bb054d01faca3aaefeeaee544ca0c7a07e6820898c0f"
        )
    ]
)
