#!bin/bash

echo "##### uninstall CLI #####"

if [ -n $(which k9s) ]; then
  echo "----- uninstall k9s -----"
  brew uninstall derailed/k9s/k9s
fi

echo "##### uninstall to setup CLI #####"
