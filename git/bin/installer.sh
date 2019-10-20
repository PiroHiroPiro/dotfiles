#!bin/bash

echo "##### setup git #####"

if test -z $(which git); then
  echo "----- install git -----"
  xcode-select --install
fi

echo "----- link git setting files -----"
LINK_FILES=(.gitconfig .gitignore_global)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null
  ln -sf $(PWD)/git/$file ~/$file; \
done

echo "##### finish to setup git #####"
