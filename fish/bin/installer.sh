#!bin/bash

echo "##### setup fish #####"

if test -z $(which fish); then
  echo "----- install fish -----"
  if [ "$(uname)" == "Darwin" ]; then
    if test -z $(which brew); then
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew install fish fzf
    sudo sh -c "echo $(which fish) >> /etc/shells"
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt install -y fish fzf
  fi
fi

echo "----- link fish setting files -----"
if [ ! -d ~/.config ]; then
  echo "create ~/.config directory"
  mkdir ~/.config
fi

LINK_FILES=(.config/fish)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null
  ln -sf $(PWD)/fish/$file ~/$file; \
done

echo "----- change default shell -----"
echo "----- change default shell -----"
if [ "$(uname)" == "Darwin" ]; then
  if [ "$(dscl . -read ~/ UserShell | sed 's/UserShell: //')" != "$(which fish)" ]; then
    chsh -s $(which fish)
  fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  if [ "$(echo $SHELL)" != "$(which fish)" ]; then
    chsh -s $(which fish)
  fi
fi

echo "##### finish to setup fish #####"
