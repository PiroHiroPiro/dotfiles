#!bin/bash

echo "##### uninstall CLI #####"

if [ -n $(which k9s) ]; then
  echo "----- uninstall k9s -----"
  brew uninstall derailed/k9s/k9s
fi

if [ -n $(which docui) ]; then
  echo "----- uninstall docui -----"
  brew uninstall docui
fi

if [ -n $(which duf) ]; then
  echo "----- uninstall duf -----"
  brew uninstall duf
fi

if [ -n $(which exa) ]; then
  echo "----- uninstall exa -----"
  brew uninstall exa
fi

if [ -n $(which fd) ]; then
  echo "----- uninstall fd -----"
  brew uninstall fd
fi

echo "##### uninstall to setup CLI #####"
