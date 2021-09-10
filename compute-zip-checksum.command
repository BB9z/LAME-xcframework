#!/bin/sh
set -euo pipefail
cd "$(dirname "$0")"
echo "$PWD"

swift package compute-checksum macosx/LAME.xcframework.zip
