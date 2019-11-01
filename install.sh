#/bin/bash

DOTPATH=~/dotfiles

if [ -d $DOTPATH ]; then
  read -p "The folder (${DOTPATH}) exists. Do you want to overwrite it ? [y/N]: " yn </dev/tty
  case "$yn" in [yY]*) ;; *) exit ;; esac
  rm -rf $DOTPATH
fi

# git が使えるなら git
if [ -n $(which git) ]; then
  git clone --recursive "https://github.com/PiroHiroPiro/dotfiles.git" $DOTPATH

# 使えない場合は curl を使用する
elif [ -n $(which curl)]; then
  curl -sSL "https://github.com/PiroHiroPiro/dotfiles/archive/master.tar.gz" | tar zxv
  # 解凍したら，DOTPATH に置く
  mv -f dotfiles-master $DOTPATH

else
  echo "git or curl required"
  exit 1
fi

cd ${DOTPATH}

if [ $? -ne 0 ]; then
  echo "not found: ${DOTPATH}"
  exit 1
fi

# make の確認
if [ -z $(which make) ]; then
  xcode-select --install
fi

# 移動できたら make を実行する
make init

# 終了
exit 0
