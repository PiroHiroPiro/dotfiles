#!bin/bash

echo "##### install font #####"

echo "----- install FiraCode -----"
if [ -e ~/Library/Fonts/FiraCode-Medium.ttf ]; then
  echo "FiraCode already exists"
else
  brew tap homebrew/cask-fonts
  brew install --cask font-fira-code
fi

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
