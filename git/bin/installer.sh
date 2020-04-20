#!bin/bash

echo "##### setup git #####"

if [ -z $(which git) ]; then
  echo "----- install git -----"
  brew install git
fi

echo "----- link git setting files -----"
LINK_FILES=(.config/git)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null
  ln -sf $(pwd)/git/$file ~/$file; \
done

echo "----- install CLI -----"
CLI_LIST=(hub lazygit)
for cli in ${CLI_LIST[@]}; do \
  if [ -z $(which $cli) ]; then
    brew install $cli
  fi
done

echo "##### finish to setup git #####"
