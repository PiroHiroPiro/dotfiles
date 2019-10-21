#!bin/bash

echo "##### setup neovim #####"

bash ./nvim/bin/font-installer.sh

if [ -z $(which nvim) ]; then
  echo "----- install neovim -----"
  brew install neovim
fi

bash ./nvim/bin/dependency-installer.sh

echo "----- link neovim setting files -----"
if [ ! -d ~/.config ]; then
  echo "create ~/.config directory"
  mkdir ~/.config
fi

LINK_FILES=(.config/dein .config/nvim)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null
  ln -sf $(pwd)/nvim/$file ~/$file; \
done

echo "----- install dein.vim -----"
if [ -d ~/.config/dein/repos/github.com/Shougo/dein.vim/ ]; then
  echo "dein.vim is already installed"
else
  if [ ! -f ~/.config/dein/installer.sh ]; then
    echo "install dein installer.sh"
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/.config/dein/installer.sh
  fi
  bash ~/.config/dein/installer.sh ~/.config/dein/ &>/dev/null
fi

echo "##### finish to setup neovim #####"
