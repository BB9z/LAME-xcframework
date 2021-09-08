#!/bin/sh
set -euo pipefail
echo "$PWD"

xcodebuild archive \
    -scheme LAME-macOS \
    -destination "generic/platform=macOS" \
    -archivePath "build/macOS" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
    -scheme LAME-iOS \
    -destination "generic/platform=iOS" \
    -archivePath "build/iOS" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
    -scheme LAME-iOS \
    -destination "generic/platform=iOS Simulator" \
    -archivePath "build/iOS-Simulator" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
    -scheme LAME-iOS \
    -destination "generic/platform=macOS,variant=Mac Catalyst" \
    -archivePath "build/Catalyst" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
    -scheme LAME-tvOS \
    -destination "generic/platform=tvOS" \
    -archivePath "build/tvOS" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
    -scheme LAME-tvOS \
    -destination "generic/platform=tvOS Simulator" \
    -archivePath "build/tvOS-Simulator" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
    -scheme LAME-watchOS \
    -destination "generic/platform=watchOS" \
    -archivePath "build/watchOS" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
    -scheme LAME-watchOS \
    -destination "generic/platform=watchOS Simulator" \
    -archivePath "build/watchOS-Simulator" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
    -framework "build/macOS.xcarchive/Products/Library/Frameworks/LAME-macOS.framework" \
    -framework "build/iOS.xcarchive/Products/Library/Frameworks/LAME-iOS.framework" \
    -framework "build/iOS-Simulator.xcarchive/Products/Library/Frameworks/LAME-iOS.framework" \
    -framework "build/Catalyst.xcarchive/Products/Library/Frameworks/LAME-iOS.framework" \
    -framework "build/tvOS.xcarchive/Products/Library/Frameworks/LAME-tvOS.framework" \
    -framework "build/tvOS-Simulator.xcarchive/Products/Library/Frameworks/LAME-tvOS.framework" \
    -framework "build/watchOS.xcarchive/Products/Library/Frameworks/LAME-watchOS.framework" \
    -framework "build/watchOS-Simulator.xcarchive/Products/Library/Frameworks/LAME-watchOS.framework" \
    -output "LAME.xcframework"
