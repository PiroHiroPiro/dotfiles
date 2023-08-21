#/bin/bash

DOTPATH=~/dotfiles

if [ -d $DOTPATH ]; then
  read -p "The folder (${DOTPATH}) exists. Do you want to overwrite it ? [y/N]: " yn </dev/tty
  case "$yn" in [yY]*) ;; *) exit ;; esac
  rm -rf $DOTPATH
fi

# git / make のインストール
xcode-select --install

# git が使えるなら git
if [ -n $(which git) ]; then
  git clone --recursive "https://github.com/PiroHiroPiro/dotfiles.git" $DOTPATH

# 使えない場合は curl を使用する
elif [ -n $(which curl)]; then
  curl -sSL "https://github.com/PiroHiroPiro/dotfiles/archive/main.tar.gz" | tar zxv
  # 解凍したら，DOTPATH に置く
  mv -f dotfiles-main $DOTPATH

else
  echo "git or curl required"
  exit 1
fi

cd ${DOTPATH}

if [ $? -ne 0 ]; then
  echo "not found: ${DOTPATH}"
  exit 1
fi

echo "Please run the following command: cd ~/dotfiles; make help"

# 終了
exit 0
