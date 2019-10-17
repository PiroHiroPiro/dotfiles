#!bin/bash

echo "##### uninstall zsh #####"

if test -n $(which zsh); then
  echo "----- uninstall zsh -----"
  if [ "$(uname)" == "Darwin" ]; then
    brew uninstall zsh zplug
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt uninstall -y zsh
    sudo rm -rf ~/.zplug
  fi
fi

echo "----- unlink zsh setting files -----"
LINK_FILES=(.zprofile .zshrc .zsh_aliases)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null; ¥
done

echo "----- change default shell -----"
chsh -s $(which bash)

echo "##### finish to uninstall zsh #####"
