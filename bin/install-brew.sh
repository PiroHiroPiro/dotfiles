#!bin/bash

if [ -z $(which brew) ]; then
    echo "----- install homebrew -----"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew cask
    brew update
    brew upgrade
fi
