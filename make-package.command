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
zip -r -9 LAME.xcframework.zip LAME.xcframework LICENSE LICENSE-LAME

checksum=$(swift package compute-checksum LAME.xcframework.zip)
echo "Checksum: $checksum"
