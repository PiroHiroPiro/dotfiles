#!bin/bash

CURRENT_PATH=$(PWD)

echo "##### install dependencies #####"
if [ "$(uname)" == "Darwin" ]; then
  if test -z $(which brew); then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  echo "------ install yarn -----"
  if test -z $(which yarn); then
    brew install yarn
  fi
  echo "------ install fzf -----"
  if test -z $(which fzf); then
    brew install fzf
  fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  echo "------ install yarn -----"
  if test -z $(which yarn); then
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
    sudo apt update && sudo apt install -y yarn
  fi
  echo "------ install fzf -----"
  if test -z $(which fzf); then
    sudo apt install fzf
  fi
fi

echo "##### install Language Server #####"
if [ ! -d ~/langserver ]; then
  mkdir ~/langserver
fi

echo "----- install bash-language-server -----"
if test -z $(which bash-language-server); then
  yarn global add bash-language-server
fi

echo "----- install dockerfile-language-server -----"
if test -z $(which docker-langserver); then
  yarn global add dockerfile-language-server-nodejs
fi

echo "----- install yaml-language-server -----"
if test -e ~/langserver/yaml-language-server/out/server/src/server.js; then
  echo "yaml-language-server already exists"
else
  cd ~/langserver && \
    git clone https://github.com/redhat-developer/yaml-language-server.git && \
    cd yaml-language-server && \
    yarn && yarn run compile && \
    cd $CURRENT_PATH
fi
