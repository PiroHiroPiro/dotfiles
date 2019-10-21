#!bin/bash

echo "##### setup vscode #####"

if [ -z $(which code) ]; then
  echo "----- install vscode -----"
  brew cask install visual-studio-code
fi

echo "----- link vscode setting files -----"
LINK_FILES=(settings.json)
for file in ${LINK_FILES[@]}; do \
    unlink ~/Library/Application\ Support/Code/User/$file&>/dev/null
    ln -sf $(pwd)/mac/vscode/$file ~/Library/Application\ Support/Code/User/$file; \
done

echo "----- install vscode extensions -----"
EXTENSIONS=$(cat $(pwd)/mac/vscode/extensions.list)
for extension in ${EXTENSIONS[@]}; do \
    code --install-extension $extension; \
done

echo "##### finish to setup vscode #####"
