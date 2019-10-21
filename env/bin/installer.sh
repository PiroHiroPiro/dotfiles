#!bin/bash

echo "##### install anyenv #####"

if [ -z $(which anyenv) ]; then
  git clone https://github.com/riywo/anyenv ~/.anyenv
  export PATH="$HOME/.anyenv/bin:$PATH"
  anyenv init
  mkdir -p $(anyenv root)/plugins
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
  git clone https://github.com/znz/anyenv-git.git $(anyenv root)/plugins/anyenv-git
fi

echo "##### install pyenv #####"
if [ -z $(which pyenv) ]; then
  anyenv install pyenv
  pyenv init
fi

echo "##### install goenv #####"
if [ -z $(which goenv) ]; then
  anyenv install goenv
fi
