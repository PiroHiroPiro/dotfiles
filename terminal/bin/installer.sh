#!bin/bash

echo "##### setup CLI #####"

if [ -z $(which k9s) ]; then
  echo "----- install k9s -----"
  brew install derailed/k9s/k9s
fi

if [ -z $(which duf) ]; then
  echo "----- install duf -----"
  brew tap muesli/tap
  brew install duf
fi

if [ -z $(which eza) ]; then
  echo "----- install eza -----"
  brew install eza
fi

if [ -z $(which fd) ]; then
  echo "----- install fd -----"
  brew install fd
fi

if [ -z $(which procs) ]; then
  echo "----- install procs -----"
  brew install procs
fi

if [ -z $(which rg) ]; then
  echo "----- install ripgrep -----"
  brew install ripgrep
fi

echo "##### finish to setup CLI #####"
