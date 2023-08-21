# vi modeではなんか[I]みたいなの出るからオーバーライド
function fish_mode_prompt
end

# prompt
function fish_prompt
  if [ $status -eq 0 ]
    set prompt " >><(( o> "
  else
    set prompt " >><(( x> "
  end
  set_color --bold white
  echo -n (prompt_pwd)
  set_color --bold cyan
  echo -n $prompt
end

# gitのbranch名の抽出
function git_branch
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
end

# 右prompt
function fish_right_prompt
  echo [(git_branch)]
end

# cd後にls
function cd
  builtin cd $argv; and ls
end

# more alias for ls
alias ll="ls -lahG"

# more alias for editor
alias vim="nvim"
alias emacs="vim"

# more alias for vagrant
alias v="vagrant"
alias vh="vagrant halt"
alias vr="vagrant reload"
alias vs="vagrant ssh"
alias vu="vagrant up"
alias vp="vagrant provision"

# more alias for docker
alias d="docker"
alias dc="docker-compose"
alias dsp="docker system prune"

# more alias for kubernetes
# alias k="kubectl"

# more alias for git
alias g="git"
alias gb="git branch"
alias gd="git diff"
alias gs="git status"
alias gcm="git checkout main"
alias gpom="git pull origin main"

# more alias for lazygit
alias lg="lazygit"

# more alias for tmux
alias t="tmux"

# more alias for cd
alias dev="cd ~/dev"

# git
set -x PATH /usr/local/bin $PATH

# qmk firmware
set -x PATH /usr/local/opt/avr-gcc@7/bin $PATH
set -x LDFLAGS -L/usr/local/opt/avr-gcc@7/lib

# tmux
if [ -z (echo $TMUX) ]
  tmux
end
