if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

export PATH="$HOME/.anyenv/bin:$PATH"
if which anyenv > /dev/null; then eval "$(anyenv init -)"; fi

export PIPENV_VENV_IN_PROJECT=1

exec fish
