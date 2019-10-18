if [ -f ~/.zshrc ]; then
  . ~/.zsh_aliases
fi

source ~/.zplug/init.zsh

# 色を使用出来るようにする
autoload -Uz colors
colors

# 補完機能
autoload -U compinit
compinit

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# 同じコマンドをヒストリに残さない
setopt hist_ignore_dups
# 同時に起動したzshの間でヒストリを共有する
setopt share_history
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 補完で小文字でも大文字にマッチさせる
zstyle ":completion:*" matcher-list "m:{a-z}={A-Z}"

# ps コマンドのプロセス名補完
zstyle ":completion:*:processes" command "ps x -o pid,s,args"

# tmux
source ~/.config/zsh/tmux.zsh

# zplug
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "plugins/git", from:oh-my-zsh
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "stedolan/jq", from:gh-r, as:command, rename-to:"jq"
zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/emoji-cli"
zplug "b4b4r07/httpstat", as:command, use:"(*).sh", rename-to:"$1"

# source plugins and add commands to the PATH
if ! zplug check; then zplug install ;fi
zplug load

# enhancd
ENHANCD_HOOK_AFTER_CD="ls -GFl"

# spaceship-prompt
export SPACESHIP_CHAR_SYMBOL="%(?.>><(( o>.>><(( x>) "
export SPACESHIP_DIR_TRUNC_REPO=false
