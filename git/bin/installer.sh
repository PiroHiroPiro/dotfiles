#!bin/bash

echo "##### setup git #####"

if [ -z $(which git) ]; then
  echo "----- install git -----"
  xcode-select --install
fi

echo "----- link git setting files -----"
LINK_FILES=(.gitconfig .gitignore_global)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null
  ln -sf $(pwd)/git/$file ~/$file; \
done

echo "----- install GitHub CLI -----"
if [ -z $(which hub) ]; then
  brew install hub
fi

echo "##### finish to setup git #####"
