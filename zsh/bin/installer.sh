#!bin/bash

echo "##### setup zsh #####"

if ! brew list zsh > /dev/null 2>&1; then
  echo "----- install zsh -----"
  brew install zsh
  sudo sh -c "echo $(command -v zsh) >> /etc/shells"
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
LINK_FILES=(.zprofile .zshrc)
if [ ! -d ~/.zsh ]; then
  mkdir ~/.zsh
fi
for file in ${LINK_FILES[@]}; do \
  unlink ~/.zsh/$file&>/dev/null
  ln -sf $(pwd)/zsh/$file ~/.zsh/$file; \
done

bash ./zsh/bin/font-installer.sh

echo "----- change default shell -----"
if [ "$(dscl . -read ~/ UserShell | sed 's/UserShell: //')" != "$(command -v zsh)" ]; then
  chsh -s $(command -v zsh)
fi

echo "##### finish to setup zsh #####"
