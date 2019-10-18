#!bin/bash

echo "##### setup tmux #####"

if test -z $(which tmux); then
  echo "----- install tmux -----"
  if [ "$(uname)" == "Darwin" ]; then
    if test -z $(which brew); then
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew install tmux reattach-to-user-namespace
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt install -y tmux
  fi
fi

echo "----- link tmux setting files -----"
LINK_FILES=(.tmux.conf .config/tmux)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null
  ln -sf $(PWD)/tmux/$file ~/$file; \
done

tmux source ~/.tmux.conf

echo "##### finish to setup tmux #####"
