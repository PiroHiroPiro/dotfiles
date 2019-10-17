#!bin/bash

echo "##### install mac apps #####"

echo "----- install brew -----"
if test -z $(brew --prefix); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install caskroom/cask/brew-cask
fi

echo "----- install iterm -----"
if [ -d /Applications/iTerm.app ]; then
  echo "iterm already exists"
else
  brew cask install iterm2
fi

# iTermのダークテーマをインストール
open "${HOME}/init/Solarized Dark.itermcolors"

echo "----- install Google Chrome -----"
if [ -d "/Applications/Google Chrome.app" ]; then
  echo "Google Chrome already exists"
else
  brew cask install google-chrome
fi

echo "----- install Backup and Sync -----"
if [ -d "/Applications/Backup and Sync.app" ]; then
  echo "Backup and Sync already exists"
else
  brew cask install google-backup-and-sync
fi

echo "----- install Slack -----"
if [ -d /Applications/Slack.app ]; then
  echo "Slack already exists"
else
  brew cask install slack
fi

echo "----- install Docker -----"
if [ -d /Applications/Docker.app ]; then
  echo "Docker already exists"
else
  brew cask install docker
fi

echo "----- install Visual Studio Code -----"
if [ -d "/Applications/Visual Studio Code.app" ]; then
  echo "Visual Studio Code already exists"
else
  brew cask install visual-studio-code
fi

echo "----- install qmk dependencies -----"
if [ -z $(which avr-gcc) ]; then
  brew tap osx-cross/avr
  brew install avr-gcc
  brew install avrdude
else
  echo "qmk dependencies already exists"
fi

echo "----- install Cyberduck -----"
if [ -d /Applications/Cyberduck.app ]; then
  echo "Cyberduck already exists"
else
  brew cask install cyberduck
fi

echo "----- install Postman -----"
if [ -d /Applications/Postman.app ]; then
  echo "Postman already exists"
else
  brew cask install postman
fi

echo "----- install TeamSQL -----"
if [ -d /Applications/TeamSQL.app ]; then
  echo "TeamSQL already exists"
else
  brew cask install teamsql
fi

echo "----- install MongoDB Compass Community -----"
if [ -d "/Applications/MongoDB Compass Community.app" ]; then
  echo "MongoDB Compass Community already exists"
else
  brew cask install mongodb-compass-community
fi

echo "----- install Clipy -----"
if [ -d /Applications/Clipy.app ]; then
  echo "Clipy already exists"
else
  brew cask install clipy
fi

echo "----- install Spectacle -----"
if [ -d /Applications/Spectacle.app ]; then
  echo "Spectacle already exists"
else
  brew cask install spectacle
fi

echo "##### finish to install mac apps #####"
