#!bin/bash

echo "##### uninstall pyenv #####"
if [ -n $(which pyenv) ]; then
  anyenv uninstall pyenv
fi

echo "##### uninstall goenv #####"
if [ -n $(which goenv) ]; then
  anyenv uninstall goenv
fi

echo "##### uninstall anyenv #####"
if [ -n $(which anyenv) ]; then
  rm -rf ~/.anyenv
fi
