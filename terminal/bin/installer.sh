#!bin/bash

echo "##### setup CLI #####"

if [ -z $(which k9s) ]; then
  echo "----- install k9s -----"
  brew install derailed/k9s/k9s
fi

echo "##### finish to setup CLI #####"
