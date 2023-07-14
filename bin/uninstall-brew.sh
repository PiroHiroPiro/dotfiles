#!bin/bash

if [ -n $(which brew) ]; then
    echo "----- uninstall homebrew -----"
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
fi
