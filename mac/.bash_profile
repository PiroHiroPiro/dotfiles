if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# go
export GOPATH=~/go
export PATH=$GOPATH/bin:$PATH

# anyenv
export PATH=$HOME/.anyenv/bin:$PATH
if which anyenv > /dev/null; then eval "$(anyenv init -)"; fi

# pipenv
export PIPENV_VENV_IN_PROJECT=1

exec fish
