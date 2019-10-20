#!bin/bash

echo "##### setup fish #####"

if test -z $(which fish); then
  echo "----- install fish -----"
  if test -z $(which brew); then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew install fish fzf
  sudo sh -c "echo $(which fish) >> /etc/shells"
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
if [ "$(dscl . -read ~/ UserShell | sed 's/UserShell: //')" != "$(which fish)" ]; then
  chsh -s $(which fish)
fi

echo "##### finish to setup fish #####"
