#!bin/bash

if [ -z $(which brew) ]; then
    echo "----- install homebrew -----"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install caskroom/cask/brew-cask
fi
