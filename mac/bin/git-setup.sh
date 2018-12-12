#!bin/bash

echo "##### link git setting files ######"

LINK_FILES=(.gitconfig .gitignore_global)

for file in ${LINK_FILES[@]}; do \
  unlink ~/$file&>/dev/null
  ln -sf $(PWD)/mac/$file ~/$file; \
done

echo "##### finish link git setting files #####"
