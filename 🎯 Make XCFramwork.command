#!/bin/sh
set -euo pipefail
cd "$(dirname "$0")/macosx"
echo "$PWD"

if [ -x "$(command -v xcpretty)" ]; then
    ./make-xcframework.sh | xcpretty
else
    ./make-xcframework.sh
fi
