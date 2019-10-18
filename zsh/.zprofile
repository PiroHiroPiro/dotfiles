# anyenv
export PATH=$HOME/.anyenv/bin:$PATH
if which anyenv > /dev/null; then eval "$(anyenv init -)"; fi

# pyenv
export PATH=$HOME/.anyenv/envs/pyenv/bin:$PATH
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# pipenv
export PIPENV_VENV_IN_PROJECT=1
