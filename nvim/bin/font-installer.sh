#!bin/bash

echo "##### install font #####"

echo "----- install FiraCode -----"
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

echo "----- install PowerLine fonts -----"
if [ -z "$(ls ~/Library/Fonts/ | grep powerline)" ]; then
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts
else
  echo "PowerLine fonts already exists"
fi
