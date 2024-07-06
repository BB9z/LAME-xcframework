# ![LAME.xcframework](https://repository-images.githubusercontent.com/404309760/90d67cd6-bfca-4180-9055-e60f92d206af)

[![Swift Version](https://img.shields.io/badge/Swift-5.3~5.9-F05138.svg?style=flat-square)](https://swift.org)
[![Swift Package Manager](https://img.shields.io/badge/spm-compatible-F05138.svg?style=flat-square)](https://swift.org/package-manager)
[![CocoaPods](https://img.shields.io/cocoapods/v/LAME-xcframework.svg?style=flat-square&colorA=555555&colorB=F05138)](https://cocoapods.org/pods/LAME-xcframework)
[![Build Status](https://img.shields.io/github/actions/workflow/status/bb9z/LAME-xcframework/ci.yml?branch=main&style=flat-square&colorA=555555&colorB=F05138)](https://github.com/bb9z/LAME-xcframework/actions)
[![gitee 镜像](https://img.shields.io/badge/%E9%95%9C%E5%83%8F-gitee-C61E22.svg?style=flat-square)](https://gitee.com/bb9z/LAME-xcframework)
[![GitHub Source](https://img.shields.io/badge/Source-GitHub-24292F.svg?style=flat-square)](https://github.com/bb9z/LAME-xcframework)

这个项目旨在将 [LAME](https://lame.sourceforge.io) 打包成 Apple 各平台通用的 xcframework 格式，并支持使用 Swift Package Manager 或 CocoaPods 进行便捷的集成。

This project aims to archive [LAME](https://lame.sourceforge.io) into the xcframework format supports all Apple platforms. It also supports integration using Swift Package Manager or CocoaPods for convenience.

## 版本信息

## Version Details

LAME.xcframework | Build with   | macOS  | iOS   | tvOS  | watchOS | visionOS
-----------------|--------------|--------|-------|-------|---------|---------
3.100.2          | Xcode 15.4   | 10.13+ | 12.0+ | 12.0+ | 4.0+    | 1.0+
3.100.0          | Xcode 12.5.1 | 10.10+ |  9.0+ |  9.0+ | 2.0+    | NA

## 集成

You can also use [GitHub source](https://github.com/bb9z/LAME-xcframework) to install.

### Swift Package Manager

通过 Xcode 菜单：

1. File -> Swift Packages -> Add Package Dependenc
2. 输入 https://github.com/bb9z/LAME-xcframework

或者在 Package.swift 中添加 LAME 依赖：

```swift
dependencies: [
    .package(url: "https://github.com/BB9z/LAME-xcframework.git", .upToNextMajor(from: "3.100.1"))
]
```

然后在你的 target 中添加 LAME 依赖：

```swift
.target(name: "YourTarget", dependencies: [
    .product(name: "LAME", package: "LAME-xcframework"),
])
```

### CocoaPods

```ruby
pod 'LAME-xcframework', '~> 3.100'
```

### 手动

拉取仓库后自行打包 xcframework（详见下方），并将 `LAME.xcframework` 加入到你的项目中。

## Installation

### Swift Package Manager

Through Xcode menu:

1. File -> Swift Packages -> Add Package Dependency...
2. Enter URL https://github.com/BB9z/LAME-xcframework

Through Package.swift, add LAME as a dependency:

```swift
dependencies: [
    .package(url: "https://github.com/BB9z/LAME-xcframework.git", .upToNextMajor(from: "3.100.1"))
]
```

Then add LAME to your target dependencies, like this:

```swift
.target(name: "YourTarget", dependencies: [
    .product(name: "LAME", package: "LAME-xcframework"),
])
```

> Tips: 中国大陆用户建议使用 [gitee 镜像](https://gitee.com/bb9z/LAME-xcframework)，安装更稳定。

### CocoaPods

```ruby
pod 'LAME-xcframework', '~> 3.100'
```

### Manually

Download source then build the xcframework yourself (see below for details). Then drag `LAME.xcframework` into your project.

## 自行构建

右键点击 make-xcframwork.command 选择「打开」。

或者使用命令行：

```shell
cd macosx
./make-xcframework.sh
```

## Build it yourself

Right-click make-xcframwork.command and select "Open".

Or use the following commands.

```shell
cd macosx
./make-xcframework.sh
```

## Maintenance Notes

### Release

1. Update version in xcconfig and podspec.
2. Make package.
3. Update package url and checksum in Package.swift and podspec.
