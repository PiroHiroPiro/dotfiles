#!bin/bash

echo "##### uninstall tmux #####"

if test -n $(which tmux); then
  echo "----- uninstall tmux -----"
  if [ "$(uname)" == "Darwin" ]; then
    brew uninstall tmux reattach-to-user-namespace
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt uninstall -y tmux
  fi
fi

echo "----- unlink tmux setting files -----"
LINK_FILES=(.tmux.conf .config/tmux)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null; \
done

echo "##### finish to uninstall tmux #####"
