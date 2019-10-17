#!bin/bash

echo "##### setup zsh #####"

if [ "$(uname)" == "Darwin" ]; then
  if test -z $(which zsh); then
    echo "----- install zsh -----"
    if test -z $(which brew); then
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew install zsh
  fi
  if [ ! -d ~/.zplug ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
  fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  if test -z $(which zsh); then
    echo "----- install zsh -----"
    sudo apt install -y zsh
  fi
  if [ ! -d ~/.zplug ]; then
    echo "----- install zplug -----"
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh
  fi
fi

echo "----- link zsh setting files -----"
LINK_FILES=(.zprofile .zshrc .zsh_aliases)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null
  ln -sf $(PWD)/zsh/$file ~/$file; \
done

echo "----- change default shell -----"
if [ "$(uname)" == "Darwin" ]; then
  if [ "$(dscl . -read ~/ UserShell | sed 's/UserShell: //')" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
  fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  if [ "$(echo $SHELL)" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
  fi
fi

echo "##### finish to setup zsh #####"
