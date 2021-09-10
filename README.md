# LAME.xcframework

[![Swift Version](https://img.shields.io/badge/Swift-5.3+-F05138.svg?style=flat-square)](https://swift.org)
[![Swift Package Manager](https://img.shields.io/badge/spm-compatible-F05138.svg?style=flat-square)](https://swift.org/package-manager)
[![Build Status](https://img.shields.io/github/workflow/status/bb9z/LAME-xcframework/CI?style=flat-square&colorA=555555&colorB=F05138)](https://github.com/bb9z/LAME-xcframework/actions)
[![gitee 镜像](https://img.shields.io/badge/%E9%95%9C%E5%83%8F-gitee-C61E22.svg?style=flat-square)](https://gitee.com/bb9z/LAME-xcframework)

This project aims to archive [LAME](https://lame.sourceforge.io) into the xcframework format supports all Apple platforms. It also supports integration using Swift Package Manager for convenience.

## Version Details

LAME.xcframework | Build with   | macOS  | iOS  | tvOS | watchOS
-----------------|--------------|--------|------|------|--------
3.100.0          | Xcode 12.5.1 | 10.10+ | 9.0+ | 9.0+ | 2.0+

## Installation

中国大陆用户可以使用 [gitee 镜像](https://gitee.com/bb9z/LAME-xcframework) 加快安装。

### Swift Package Manager

1. Xcode Menu: File -> Swift Packages -> Add Package Dependency...
2. Input https://github.com/bb9z/LAME-xcframework

### Manually

Download source then build the xcframework yourself (see below for details). Then drag `LAME.xcframework` into your project.

## Build it yourself

Right-click make-xcframwork.command and select "Open".

Or use the following commands.

```shell
cd macosx
./make-xcframework.sh
```
