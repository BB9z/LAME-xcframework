#!/bin/sh

# The script to create LAME.xcframework
# Copyright © 2021, 2024 BB9z.
# https://github.com/BB9z/LAME-xcframework

# The MIT License
# https://opensource.org/licenses/MIT

set -euo pipefail
echo "$PWD"

if [ -d "LAME.xcframework" ]; then
    echo "Remove previous result."
    rm -r "LAME.xcframework"
else
    echo "No previous build, go on."
fi

xcodebuild archive \
    -scheme LAME-macOS \
    -destination "generic/platform=macOS" \
    -archivePath "build/macOS" \
    SKIP_INSTALL=NO

xcodebuild archive \
    -scheme LAME-iOS \
    -destination "generic/platform=iOS" \
    -archivePath "build/iOS" \
    SKIP_INSTALL=NO

xcodebuild archive \
    -scheme LAME-iOS \
    -destination "generic/platform=iOS Simulator" \
    -archivePath "build/iOS-Simulator" \
    SKIP_INSTALL=NO

xcodebuild archive \
    -scheme LAME-iOS \
    -destination "generic/platform=macOS,variant=Mac Catalyst" \
    -archivePath "build/Catalyst" \
    SKIP_INSTALL=NO

xcodebuild archive \
    -scheme LAME-tvOS \
    -destination "generic/platform=tvOS" \
    -archivePath "build/tvOS" \
    SKIP_INSTALL=NO

xcodebuild archive \
    -scheme LAME-tvOS \
    -destination "generic/platform=tvOS Simulator" \
    -archivePath "build/tvOS-Simulator" \
    SKIP_INSTALL=NO

xcodebuild archive \
    -scheme LAME-watchOS \
    -destination "generic/platform=watchOS" \
    -archivePath "build/watchOS" \
    SKIP_INSTALL=NO

xcodebuild archive \
    -scheme LAME-watchOS \
    -destination "generic/platform=watchOS Simulator" \
    -archivePath "build/watchOS-Simulator" \
    SKIP_INSTALL=NO

xcodebuild archive \
    -scheme LAME-visionOS \
    -destination "generic/platform=visionOS" \
    -archivePath "build/visonOS" \
    SKIP_INSTALL=NO

xcodebuild archive \
    -scheme LAME-visionOS \
    -destination "generic/platform=visionOS Simulator" \
    -archivePath "build/visonOS-Simulator" \
    SKIP_INSTALL=NO

xcodebuild -create-xcframework \
    -framework "build/macOS.xcarchive/Products/Library/Frameworks/LAME.framework" \
    -framework "build/iOS.xcarchive/Products/Library/Frameworks/LAME.framework" \
    -framework "build/iOS-Simulator.xcarchive/Products/Library/Frameworks/LAME.framework" \
    -framework "build/Catalyst.xcarchive/Products/Library/Frameworks/LAME.framework" \
    -framework "build/tvOS.xcarchive/Products/Library/Frameworks/LAME.framework" \
    -framework "build/tvOS-Simulator.xcarchive/Products/Library/Frameworks/LAME.framework" \
    -framework "build/watchOS.xcarchive/Products/Library/Frameworks/LAME.framework" \
    -framework "build/watchOS-Simulator.xcarchive/Products/Library/Frameworks/LAME.framework" \
    -framework "build/visonOS.xcarchive/Products/Library/Frameworks/LAME.framework" \
    -framework "build/visonOS-Simulator.xcarchive/Products/Library/Frameworks/LAME.framework" \
    -output "LAME.xcframework"
