#!bin/bash

echo "##### uninstall neovim #####"

if [ -e ~/Library/Fonts/FiraCode-Regular.ttf ]; then
  rm -f ~/Library/Fonts/FiraCode-Regular.ttf
fi

rm -rf ~/.config/dein/.cache
rm -rf ~/.config/dein/cache_nvim

if test -n $(which nvim); then
  echo "----- uninstall neovim -----"
  if [ "$(uname)" == "Darwin" ]; then
    brew uninstall neovim
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt uninstall -y neovim
  fi
fi

# need uninstaller for ./nvim/bin/dependency-installer.sh

echo "----- unlink neovim setting files -----"
LINK_FILES=(.config/dein .config/nvim)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null; \
done

echo "##### finish to uninstall neovim #####"
