#!bin/bash

echo "##### setup tmux #####"

if [ -z $(which tmux) ]; then
  echo "----- install tmux -----"
  brew install tmux reattach-to-user-namespace
fi

echo "----- link tmux setting files -----"
LINK_FILES=(.tmux.conf .config/tmux)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null
  ln -sf $(pwd)/tmux/$file ~/$file; \
done

tmux source ~/.tmux.conf

echo "##### finish to setup tmux #####"
