#!bin/bash

CURRENT_PATH=$(PWD)

echo "##### install dependencies #####"
if [ -z $(which yarn) ]; then
  echo "------ install yarn -----"
  brew install yarn
fi
if [ -z $(which fzf) ]; then
  echo "------ install fzf -----"
  brew install fzf
fi

echo "##### install Language Server #####"
if [ ! -d ~/langserver ]; then
  mkdir ~/langserver
fi
