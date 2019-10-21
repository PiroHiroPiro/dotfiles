#!bin/bash

echo "##### setup zsh #####"

if [ -z $(which zsh) ]; then
  echo "----- install zsh -----"
  brew install zsh
fi
if [ ! -d ~/.zplug ]; then
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

echo "----- link zsh setting files -----"
LINK_FILES=(.zprofile .zshrc .zsh_aliases .config/zsh)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null
  ln -sf $(pwd)/zsh/$file ~/$file; \
done

bash ./zsh/bin/font-installer.sh

echo "----- change default shell -----"
if [ "$(dscl . -read ~/ UserShell | sed 's/UserShell: //')" != "$(which zsh)" ]; then
  chsh -s $(which zsh)
fi

echo "##### finish to setup zsh #####"
