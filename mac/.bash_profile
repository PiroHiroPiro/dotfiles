if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# anyenv
export PATH=$HOME/.anyenv/bin:$PATH
if which anyenv > /dev/null; then eval "$(anyenv init -)"; fi

# pipenv
export PIPENV_VENV_IN_PROJECT=1

exec fish
