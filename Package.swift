// swift-tools-version:5.9
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
        .visionOS(.v1),
    ],
    products: [
        .library(name: "LAME", targets: ["LAME"])
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "LAME",
            path: "macosx/LAME.xcframework"
        ),
//        .binaryTarget(
//            name: "LAME",
//            url: "https://github.com/BB9z/LAME-xcframework/releases/download/3.100.1/LAME.xcframework.zip",
//            checksum: "a071110cf04b0ef44da54092462361270426373341733b2dbcf748a035321c40"
//        )
    ]
)
