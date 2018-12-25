#!bin/bash

echo "##### setup macos #####"

### System
# Disable the sound effects on boot (起動音を消す)
sudo nvram SystemAudioVolume=" "
# バッテリーを%表示
defaults write com.apple.menuextra.battery ShowPercent -string YES
# メニューバーの日付表示形式指定
defaults write com.apple.menuextra.clock DateFormat -string "MM月dd日(E) a hh時mm分ss秒"
# ダウンロードしたアプリを開いたときの警告無視
defaults write com.apple.LaunchServices LSQuarantine -int 0
# MissionControlでデスクトップの順番が入れ替わるの禁止
defaults write com.apple.dock mru-spaces -int 0
# ダッシュボードの無効化
defaults write com.apple.dashboard mcx-disabled -int 1
# 自動で大文字化する機能無効化
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -int 0

### Trackpad
# 3本指でmission control & expose(com.apple.dock)
defaults write com.apple.dock showMissionControlGestureEnabled -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFiveFingerPinchGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerPinchGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadHandResting -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadHorizScroll -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadMomentumScroll -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadPinch -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRotate -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadScroll -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerTapGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerDoubleTapGesture -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad USBMouseStopsTrackpad -int 0

### Dock and Finder
# Finderの初期フォルダをhomeに設定
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/"
# show hidden files by default （非表示ファイルを表示する）
defaults write com.apple.finder AppleShowAllFiles -int 1
# show all filename extensions （ファイルの拡張子を全て表示する）
defaults write NSGlobalDomain AppleShowAllExtensions -int 1
# Disable the warning when changing a file extension （拡張子の変更時のWarningを表示しsない）
defaults write com.apple.finder FXEnableExtensionChangeWarning -int 0
# Automatically hide or show the Dock （Dock を自動的に隠す）
defaults write com.apple.dock autohide -int 1
# Wipe all app icons from the Dock （Dock に標準で入っている全てのアプリを消す、Finder とごみ箱は消えない）
# defaults write com.apple.dock persistent-apps -array

### Reboot
echo "Rebooting is necessary to reflect the setting."
read -p "Would you like to reboot now?: (y/N)" yn
case "$yn" in [yY]*) ;; *) echo "Terminate setup macos." ; exit 1 ;; esac

# Sudo reboot (再起動して設定を反映させる)
sudo reboot
