#!/bin/bash

echo "Build Modular"
cd ./Modular && set -o pipefail && xcodebuild -scheme "Modular-iOS" -destination 'platform=iOS Simulator,name=iPhone X'
set -o pipefail && xcodebuild -scheme "Modular-tvOS" -destination 'platform=tvOS Simulator,name=Apple TV 4K'
# set -o pipefail && xcodebuild -scheme "Modular-macOS" -destination 'platform=macOS,arch=x86_64'
