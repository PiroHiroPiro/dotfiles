#!bin/bash

echo "##### uninstall fish #####"

echo "----- change default shell -----"
chsh -s $(which bash)

echo "----- unlink fish setting files -----"
LINK_FILES=(.config/fish)
for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null; \
done

if [ -n $(fish) ]; then
  echo "----- uninstall fish -----"
  brew uninstall fish
fi

echo "##### finish to uninstall fish #####"
