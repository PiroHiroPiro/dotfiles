#!bin/bash

echo "##### setup CLI #####"

if [ -z $(which k9s) ]; then
  echo "----- install k9s -----"
  brew install derailed/k9s/k9s
fi

if [ -z $(which docui) ]; then
  echo "----- install docui -----"
  brew install docui
fi

if [ -z $(which duf) ]; then
  echo "----- install duf -----"
  brew tap muesli/tap
  brew install duf
fi

if [ -z $(which exa) ]; then
  echo "----- install exa -----"
  brew install exa
fi

if [ -z $(which fd) ]; then
  echo "----- install fd -----"
  brew install fd
fi

echo "##### finish to setup CLI #####"
