#!bin/bash

echo "##### uninstall tmux #####"

echo "----- unlink tmux setting files -----"
LINK_FILES=(.tmux.conf .config/tmux)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null; \
done

if test -n $(which tmux); then
  echo "----- uninstall tmux -----"
  brew uninstall tmux reattach-to-user-namespace
fi

echo "##### finish to uninstall tmux #####"
