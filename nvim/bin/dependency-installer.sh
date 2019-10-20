#!bin/bash

CURRENT_PATH=$(PWD)

echo "##### install dependencies #####"
if test -z $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
if test -z $(which yarn); then
  echo "------ install yarn -----"
  brew install yarn
fi
if test -z $(which fzf); then
  echo "------ install fzf -----"
  brew install fzf
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
