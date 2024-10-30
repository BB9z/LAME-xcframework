#!/bin/zsh
# Copyright © 2024 BB9z.
# https://github.com/BB9z/LAME-xcframework
#
# The MIT License
# https://opensource.org/licenses/MIT

set -euo pipefail

readonly ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
# echo "$ROOT_DIR"
rm -rf "$ROOT_DIR/LAME.xcframework" "$ROOT_DIR/LAME.xcframework.zip"

cd "$ROOT_DIR/macosx"
sh ./make-xcframework.sh

cd "$ROOT_DIR"

mv "$ROOT_DIR/macosx/LAME.xcframework" "$ROOT_DIR"

readonly countDSYMs=$(find "$ROOT_DIR/LAME.xcframework" -name "*.dSYM" | wc -l)
readonly hasDSYMs=$((countDSYMs > 0))
# echo "hasDSYMs: $hasDSYMs"

if [ $hasDSYMs = 1 ]; then
    echo "\nPackaging with dSYMs..."
    zip -yr -9 LAME.xcframework_with_dsyms.zip LAME.xcframework LICENSE LICENSE-LAME COPYING

    echo "\nRemove dSYMs for package again..."
    find "$ROOT_DIR/LAME.xcframework" -name "dSYMs" -type d -exec rm -rfv {} +

    echo "Remove DebugSymbolsPath in Info.plist."
    local itemCount=$(/usr/libexec/PlistBuddy -c "Print :AvailableLibraries" "./LAME.xcframework/Info.plist" | grep -c "Dict")
    for ((i=0; i<itemCount; i++)); do
        /usr/libexec/PlistBuddy -c "Delete :AvailableLibraries:$i:DebugSymbolsPath" "./LAME.xcframework/Info.plist"
    done
fi

echo "\nPackaging..."
zip -yr -9 LAME.xcframework.zip LAME.xcframework LICENSE LICENSE-LAME COPYING

checksum=$(swift package compute-checksum LAME.xcframework.zip)
echo "Checksum: $checksum"

echo "✅ Successfully packaged LAME.xcframework at $ROOT_DIR/LAME.xcframework.zip"
