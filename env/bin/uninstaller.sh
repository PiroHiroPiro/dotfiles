#!bin/bash

echo "##### uninstall pyenv #####"
if test -n $(which pyenv); then
  anyenv uninstall pyenv
fi

echo "##### uninstall goenv #####"
if test -n $(which goenv); then
  anyenv uninstall goenv
fi

echo "##### uninstall anyenv #####"
if test -n $(which anyenv); then
  rm -rf ~/.anyenv
fi
