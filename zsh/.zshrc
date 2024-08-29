if [ -f ~/.zsh_aliases ]; then
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
# ディレクトリ名だけでcdする
setopt auto_cd
# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
# beep を無効にする
setopt no_beep
# フローコントロールを無効にする
setopt no_flow_control
# Ctrl+Dでzshを終了しない
setopt ignore_eof
# '#' 以降をコメントとして扱う
setopt interactive_comments

# C で標準出力をクリップボードにコピーする
# http://mollifier.hatenablog.com/entry/20100317/p1
alias -g C="| pbcopy"

# zplug
zplug "spaceship-prompt/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "plugins/git", from:oh-my-zsh
zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/emoji-cli"
zplug "b4b4r07/httpstat", as:command, use:"(*).sh", rename-to:"$1"
zplug "supercrabtree/k"

# source plugins and add commands to the PATH
if ! zplug check; then zplug install ;fi
zplug load

# enhancd
ENHANCD_HOOK_AFTER_CD="eza -aaF"

# spaceship-prompt
export SPACESHIP_CONFIG="$HOME/.config/spaceship-prompt/spaceship.zsh"

# zsh
source <(fzf --zsh)

# tmux
source ~/.config/zsh/tmux.zsh
