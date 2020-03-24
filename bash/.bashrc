if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# qmk firmware
export PATH="/usr/local/opt/avr-gcc@7/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/avr-gcc@7/lib"

