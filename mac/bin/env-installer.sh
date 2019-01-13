#!bin/bash

echo "##### install anyenv #####"

if test -z $(which anyenv); then
  git clone https://github.com/riywo/anyenv ~/.anyenv
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
  mkdir -p $(anyenv root)/plugins
  git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
  git clone https://github.com/znz/anyenv-git.git $(anyenv root)/plugins/anyenv-git
fi

echo "##### install pyenv #####"

if test -z $(which pyenv); then
  anyenv install pyenv
fi

echo "##### setup pyenv #####"

if test -z $(pyenv versions | grep 3.6.5 | wc -l); then
  pyenv install 3.6.5
fi

if test -z $(pyenv versions | grep 2.7.12 | wc -l); then
  pyenv install 2.7.12
fi

pyenv global 3.6.5 2.7.12
pip install --upgrade pip

if test -z $(pip freeze | grep pipenv | wc -l); then
  pip install pipenv
fi

echo "##### setup develop environment #####"

if ! test -d ~/document/dev; then
  mkdir -p ~/document/dev
fi
