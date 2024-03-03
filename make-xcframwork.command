#!/bin/sh
# Copyright © 2021, 2024 BB9z.
# https://github.com/BB9z/LAME-xcframework
#
# The MIT License
# https://opensource.org/licenses/MIT

set -euo pipefail
cd "$(dirname "$0")/macosx"
echo "$PWD"

if [ -x "$(command -v xcpretty)" ]; then
    sh ./make-xcframework.sh | xcpretty
else
    sh ./make-xcframework.sh
fi
