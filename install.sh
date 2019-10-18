#/bin/bash

DOTPATH=~/dotfiles

# git が使えるなら git
if test -z $(which git); then
  git clone --recursive "https://github.com/PiroHiroPiro/dotfiles.git" $DOTPATH

# 使えない場合は curl か wget を使用する
elif test -z $(which curl) || test -z $(which wget); then
  if test -z $(which curl); then
    curl -sSL "https://github.com/PiroHiroPiro/dotfiles/archive/master.tar.gz" -o $DOTPATH
  elif test -z $(which wget); then
    wget -O - "https://github.com/PiroHiroPiro/dotfiles/archive/master.tar.gz"
  fi | tar zxv

  # 解凍したら，DOTPATH に置く
  mv -f dotfiles-master $DOTPATH

  # 解凍したら，DOTPATH に置く
  rm -rf dotfiles-master
else
  echo "curl or wget required"
  exit(1)
fi

cd "${DOTPATH}"

if [ $? -ne 0 ]; then
  echo "not found: ${DOTPATH}"
  exit(1)
fi

# makeの確認
if test -z $(which make); then
  if [ "$(uname)" == "Darwin" ]; then
    xcode-select --install
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt install -y build-essential
  fi
fi

# 移動できたらリンクを実行する
make init

exit(0)
