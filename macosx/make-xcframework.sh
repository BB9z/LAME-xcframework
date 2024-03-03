#!/bin/zsh

# Build all platform targets and package them into the xcframework.
# Set `B9_BUILD_VISION_OS` environment variable to 0 can disable building for visionOS.
#
# Copyright © 2021, 2024 BB9z.
# https://github.com/BB9z/LAME-xcframework
#
# The MIT License
# https://opensource.org/licenses/MIT

set -euo pipefail

# Check if a variable is empty or 0 or false
#
# Return: 0 if variable is not empty or 0 or false
#
# Usage:
#   if [[ $(check_var "$test_var") == 0 ]]; then
#       echo "Variable is not 0, false, or empty"
#   else
#       echo "Variable is 0, false, or empty"
#   fi
checkVar() {
    local var_value="$1"
    if [[ -z "$var_value" || "$var_value" == "0" || "${var_value:l}" == "false" ]]; then
        echo "1"
    else
        echo "0"
    fi
}

function _xcbuild() {
    scheme=$1
    destination=$2
    archivePath=$3

    echo "\nBuilding $scheme for $destination..." >&2

    xcodebuild archive \
        -scheme $scheme \
        -destination $destination \
        -archivePath $archivePath \
        SKIP_INSTALL=NO
}

function xcbuild() {
    if ! command -v xcbeautify &> /dev/null; then
        _xcbuild "$@"
    else
        _xcbuild "$@" | xcbeautify
    fi
}

## Check environment

echo "$PWD"

readonly B9_BUILD_VISION_OS=${B9_BUILD_VISION_OS:=1}

if [[ $(checkVar "$B9_BUILD_VISION_OS") != 0 ]]; then
    echo "Skip building for visionOS."
fi

## Clean

if [ -d "LAME.xcframework" ]; then
    echo "Remove previous result."
    rm -r "LAME.xcframework"
else
    echo "No previous build, go on."
fi

## Build

xcbuild LAME-macOS "generic/platform=macOS" "build/macOS"
xcbuild LAME-iOS "generic/platform=iOS" "build/iOS"
xcbuild LAME-iOS "generic/platform=iOS Simulator" "build/iOS-Simulator"
xcbuild LAME-iOS "generic/platform=macOS,variant=Mac Catalyst" "build/Catalyst"
xcbuild LAME-tvOS "generic/platform=tvOS" "build/tvOS"
xcbuild LAME-tvOS "generic/platform=tvOS Simulator" "build/tvOS-Simulator"
xcbuild LAME-watchOS "generic/platform=watchOS" "build/watchOS"
xcbuild LAME-watchOS "generic/platform=watchOS Simulator" "build/watchOS-Simulator"
if [[ $(checkVar "$B9_BUILD_VISION_OS") == 0 ]]; then
    xcbuild LAME-visionOS "generic/platform=visionOS" "build/visonOS"
    xcbuild LAME-visionOS "generic/platform=visionOS Simulator" "build/visonOS-Simulator"
fi

## Package

archivePaths=(
  "build/macOS.xcarchive"
  "build/iOS.xcarchive"
  "build/iOS-Simulator.xcarchive"
  "build/Catalyst.xcarchive"
  "build/tvOS.xcarchive"
  "build/tvOS-Simulator.xcarchive"
  "build/watchOS.xcarchive"
  "build/watchOS-Simulator.xcarchive"
)
if [[ $(checkVar "$B9_BUILD_VISION_OS") == 0 ]]; then
    archivePaths+=("build/visonOS.xcarchive" "build/visonOS-Simulator.xcarchive")
fi

packageCmds=("xcodebuild" "-create-xcframework")
for part in $archivePaths; do
    packageCmds+=("-framework" "$part/Products/Library/Frameworks/LAME.framework")
done
packageCmds+=("-output" "LAME.xcframework")

echo "${packageCmds[*]}"
"${packageCmds[@]}"
