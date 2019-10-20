#!bin/bash

echo "##### setup vscode #####"

if test -z $(which code); then
  echo "----- install vscode -----"
  if test -z $(which brew); then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install caskroom/cask/brew-cask
  fi
  brew cask install visual-studio-code
fi

echo "----- link vscode setting files -----"
LINK_FILES=(settings.json)
for file in ${LINK_FILES[@]}; do \
    unlink ~/Library/Application\ Support/Code/User/$file&>/dev/null
    ln -sf $(PWD)/mac/vscode/$file ~/Library/Application\ Support/Code/User/$file; \
done

echo "----- install vscode extensions -----"
EXTENSIONS=$(cat ./mac/vscode/extensions.list)
for extension in ${EXTENSIONS[@]}; do \
    code --install-extension $extension; \
done

echo "##### finish to setup vscode #####"
