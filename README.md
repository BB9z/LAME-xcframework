# LAME.xcframework

[![Swift Version](https://img.shields.io/badge/Swift-5.3+-F05138.svg?style=flat-square)](https://swift.org)
[![Swift Package Manager](https://img.shields.io/badge/spm-compatible-F05138.svg?style=flat-square)](https://swift.org/package-manager)
[![Build Status](https://img.shields.io/github/workflow/status/bb9z/LAME-xcframework/CI?style=flat-square&colorA=555555&colorB=F05138)](https://github.com/bb9z/LAME-xcframework/actions)
[![gitee 镜像](https://img.shields.io/badge/%E9%95%9C%E5%83%8F-gitee-C61E22.svg?style=flat-square)](https://gitee.com/bb9z/LAME-xcframework)
[![GitHub Source](https://img.shields.io/badge/Source-GitHub-24292F.svg?style=flat-square)](https://github.com/bb9z/LAME-xcframework)

这个项目旨在将 [LAME](https://lame.sourceforge.io) 打包成 Apple 各平台通用的 xcframework 格式，并支持使用 Swift Package Manager 进行便捷的集成。

This project aims to archive [LAME](https://lame.sourceforge.io) into the xcframework format supports all Apple platforms. It also supports integration using Swift Package Manager for convenience.

## 集成

You can also use [GitHub source](https://github.com/bb9z/LAME-xcframework) to install.

### Swift Package Manager

1. Xcode 菜单: File -> Swift Packages -> Add Package Dependenc
2. 输入 https://github.com/bb9z/LAME-xcframework

### 手动

拉取仓库后自行打包 xcframework（详见下方），并将 `LAME.xcframework` 加入到你的项目中。

## Installation

中国大陆用户可以使用 [gitee 镜像](https://gitee.com/bb9z/LAME-xcframework) 加快安装。

### Swift Package Manager

1. Xcode Menu: File -> Swift Packages -> Add Package Dependency...
2. Input https://github.com/bb9z/LAME-xcframework

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
