#!bin/bash

if [ -z $(which brew) ]; then
    echo "----- install homebrew -----"
    echo 'If an error occurs, execute the following command: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew update
    brew upgrade
fi
