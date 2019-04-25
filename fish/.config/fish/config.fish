# vi modeではなんか[I]みたいなの出るからオーバーライド
function fish_mode_prompt
end

# prompt
function fish_prompt
  if [ $status -eq 0 ]
    set fish_face " >><(( o> "
  else
    set fish_face " >><(( x> "
  end
  set_color --bold white
  echo -n (prompt_pwd)
  set_color --bold cyan
  echo -n $fish_face
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

# anyenv
set -x PATH $HOME/.anyenv/bin $PATH

# pyenv
set -x PATH $HOME/.anyenv/envs/pyenv/bin $PATH
set -x PATH $HOME/.anyenv/envs/pyenv/shims $PATH
status --is-interactive; and source (pyenv init -|psub)

# goenv
set -x PATH $HOME/.anyenv/envs/goenv/bin $PATH
set -x PATH $HOME/.anyenv/envs/goenv/shims $PATH

# go
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

# avr-gcc@7
set -x PATH /usr/local/Cellar/avr-gcc@7/7.3.0/bin $PATH

# more alias for ls
alias la="ls -ls"
alias ll="ls -la"

# more alias for editor
alias vi="vim"
alias emacs="vim"

# more alias for vagrant
alias vh="vagrant halt"
alias vr="vagrant reload"
alias vs="vagrant ssh"
alias vu="vagrant up"
alias vp="vagrant provision"

# more alias for docker
alias d="docker"
alias dc="docker-compose"

# more alias for git
alias ga="git add"
alias gaa="git add ."
alias gc="git commit"
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"
alias gs="git status"
alias gcm="git checkout master"
alias gpom="git pull origin master"

# more alias for cd
alias dev="cd ~/document/dev"
