if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# git
export PATH="/usr/local/bin:$PATH"

# qmk firmware
export PATH="/usr/local/opt/avr-gcc@7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/avr-gcc@7/lib"

