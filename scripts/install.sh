#!/bin/bash

echo "Updating Brew"
brew update
brew upgrade

echo "Install Carthage"
brew install carthage

carthage update --cache-builds
