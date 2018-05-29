#!/bin/bash

# Jazzy
command_name=jazzy
if ! loc="$(type -p "$command_name")" || [ -z "$loc" ]; then
    RUBY_VERSION="2.4.1"
    # Install RVM (user ruby)
    \curl -sSL https://get.rvm.io | bash -s stable --ruby=${RUBY_VERSION}
    source $HOME/.rvm/scripts/rvm
    rvm install ${RUBY_VERSION}
    rvm use ${RUBY_VERSION}
    rvm --default use ${RUBY_VERSION}

	printf "👽	Installing Jazzy\n"
	gem install jazzy
else
	printf "😎	Jazzy is installed correctly\n"
fi

printf "👾	Generating documentation\n"

cd ./Modular && jazzy \
    --clean \
    --author Ondrej Rafaj \
    --author_url https://github.com/LiveUI \
    --github_url https://github.com/LiveUI/Modular \
    --xcodebuild-arguments -scheme,Modular-iOS \
    --module Modular-iOS

# Move the docs to the mangoweb.github.io folder if it exists
DIRECTORY="../../Web/mangoweb.github.io/Modular/docs"
if [ -d "$DIRECTORY" ]; then
	rm -rf "$DIRECTORY/latest"
	cp -rf ./docs/ "$DIRECTORY/latest/"
fi
