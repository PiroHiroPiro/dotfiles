#!bin/bash

echo "##### uninstall neovim #####"

# need uninstaller for ./nvim/bin/dependency-installer.sh

echo "----- unlink neovim setting files -----"
LINK_FILES=(.config/dein .config/nvim)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null; \
done

if [ -e ~/Library/Fonts/FiraCode-Regular.ttf ]; then
  rm -f ~/Library/Fonts/FiraCode-Regular.ttf
fi

rm -rf ~/.config/dein/.cache
rm -rf ~/.config/dein/cache_nvim

if [ -n $(which nvim) ]; then
  echo "----- uninstall neovim -----"
  brew uninstall neovim
fi

echo "##### finish to uninstall neovim #####"
