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
  echo "install dein"
  # sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"
  curl -o $(pwd)/installer.sh -fsSL https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh
  chmod +x $(pwd)/installer.sh
  sh $(pwd)/installer.sh --use-neovim-config
  rm $(pwd)/installer.sh
  
  # overwrite file after installation dein
  rm -f ~/.config/nvim/init.vim
  mv ~/.config/nvim/init.vim.pre-dein-vim ~/.config/nvim/init.vim
fi

echo "##### finish to setup neovim #####"
