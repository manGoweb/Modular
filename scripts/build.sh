#!/bin/bash

echo "Build Modular"
cd ./Example/ && set -o pipefail && xcodebuild -workspace Modular.xcworkspace -scheme "Example iOS" -destination 'platform=iOS Simulator,name=iPhone X'

