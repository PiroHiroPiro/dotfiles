#!bin/bash

echo "##### install anyenv #####"

if test -z $(which anyenv); then
  git clone https://github.com/riywo/anyenv ~/.anyenv
  export PATH="$HOME/.anyenv/bin:$PATH"
  anyenv init
  mkdir -p $(anyenv root)/plugins
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
  git clone https://github.com/znz/anyenv-git.git $(anyenv root)/plugins/anyenv-git
fi

echo "##### install pyenv #####"

if test -z $(which pyenv); then
  anyenv install pyenv
  pyenv init
fi

echo "##### install goenv #####"

if test -z $(which goenv); then
  anyenv install goenv
fi

echo "##### setup develop environment #####"

if ! test -d ~/document/dev; then
  mkdir -p ~/document/dev
fi
