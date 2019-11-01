#!bin/bash

alert() {
  echo -en "\033[31m"
  echo -n "Error: "
  echo -n $1
  echo -e "\033[m"
}

warn() {
  echo -en "\033[33m"
  echo -n "Warning: "
  echo -n $1
  echo -e "\033[m"
}

check_directory() {
  if [ ! -d $1 ]; then
    alert "not exists $1"
  fi
}

check_file() {
  if [ ! -f $1 ]; then
    $2 "not exists $1"
  fi
}

echo "##### check health #####"

echo "----- check brew -----"
if [ -z $(which brew) ]; then
  warn "not exists brew command."
fi

echo "----- check root dotfiles -----"
NECESSARY_FILES=(.bash_profile .bashrc)
for file in ${NECESSARY_FILES[@]}; do \
  check_file ~/$file alert
done

echo "----- check optional root dotfiles -----"''
OPTION_FILES=(.bash_aliases .zprofile .zshrc .zsh_aliases .gitconfig .gitignore_global .tmux.conf)
for file in ${OPTION_FILES[@]}; do \
  check_file ~/$file warn
done

ZSH_FILES=(.zprofile .zshrc .zsh_aliases)
for file in ${ZSH_FILES[@]}; do \
  check_file ~/.zsh/$file warn
done

echo "----- check ~/.config -----"
if [ ! -d ~/.config ]; then
  alert "not exits ~/.config"
else
  echo "----- check ~/.config/zsh -----"
  if [ ! -d ~/.config/zsh ]; then
    alert "not exists ~/.config/zsh"
  else
    check_file ~/.config/zsh/tmux.zsh alert
  fi

  echo "----- check ~/.config/fish -----"
  if [ ! -d ~/.config/fish ]; then
    alert "not exists ~/.config/fish"
  else
    check_file ~/.config/fish/config.fish alert
    check_directory ~/.config/fish/functions alert
  fi

  echo "----- check ~/.config/nvim -----"
  if [ ! -d ~/.config/nvim ]; then
    alert "not exists ~/.config/nvim"
  else
    check_file ~/.config/nvim/init.vim alert
    check_file ~/.config/nvim/dein.toml alert
    check_file ~/.config/nvim/spell/en.utf-8.add warn
  fi

  echo "----- check ~/.config/dein -----"
  if [ ! -d ~/.config/dein ]; then
    alert "not exists ~/.config/dein"
  else
    check_file ~/.config/dein/installer.sh warn
  fi

  echo "----- check ~/.config/tmux -----"
  if [ ! -d ~/.config/tmux ]; then
    alert "not exists ~/.config/tmux"
  else
    check_directory ~/.config/tmux alert
  fi
fi
