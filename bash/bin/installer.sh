#!bin/bash

echo "##### setup bash #####"

echo "----- link bash setting files -----"
LINK_FILES=(.bash_profile .bashrc .bash_aliases)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null
  ln -sf $(PWD)/bash/$file ~/$file; \
done

echo "----- change default shell -----"
if [ "$(uname)" == "Darwin" ]; then
  if [ "$(dscl . -read ~/ UserShell | sed 's/UserShell: //')" != "$(which bash)" ]; then
    chsh -s $(which bash)
  fi
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  if [ "$(echo $SHELL)" != "$(which bash)" ]; then
    chsh -s $(which bash)
  fi
fi

echo "##### finish to setup bash #####"
