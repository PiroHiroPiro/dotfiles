#!bin/bash

echo "##### uninstall fish #####"

echo "----- change default shell -----"
chsh -s $(which bash)

echo "----- unlink fish setting files -----"
LINK_FILES=(.config/fish)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null; \
done

if test -n $(fish); then
  echo "----- uninstall fish -----"
  if [ "$(uname)" == "Darwin" ]; then
    brew uninstall fish
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt uninstall -y fish
  fi
fi

echo "##### finish to uninstall fish #####"
