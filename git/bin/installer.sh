#!bin/bash

echo "##### setup git #####"

if [ -z $(which git) ]; then
  echo "----- install git -----"
  brew install git
fi

echo "----- link git setting files -----"
if [ ! -d ~/.config ]; then
  echo "create ~/.config directory"
  mkdir ~/.config
fi

LINK_FILES=(.config/git)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null
  ln -sf $(pwd)/git/$file ~/$file; \
done

echo "----- install CLI -----"
CLI_LIST=(gh lazygit)
for cli in ${CLI_LIST[@]}; do \
  if [ -z $(which $cli) ]; then
    brew install $cli
  fi
done

echo "----- install CLI extension -----"

gh extension install dlvhdr/gh-prs

echo "##### finish to setup git #####"
