#!bin/bash

if [ -z $(which brew) ]; then
    echo "----- install homebrew -----"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    brew install caskroom/cask/brew-cask
fi
