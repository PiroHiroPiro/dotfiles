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
alias drm="docker rm (docker ps -f status=exited -q) & docker rmi (docker images -f 'dangling=true' -q)"

# more alias for kubernetes
# alias k="kubectl"

# more alias for git
alias g="git"
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"
alias gs="git status"
alias gcm="git checkout master"
alias gpom="git pull origin master"

# more alias for hub
alias h="hub"
alias hc="hub create"
alias hb="hub browse"
alias hf="hub fork"
alias hi="hub issue"
alias his="hub issue show"
alias hic="hub issue create"
alias hp="hub pull-request"
alias hpl="hub pr list"
alias hpc="hub pr checkout"

# more alias for lazygit
alias lg="lazygit"

# more alias for tmux
alias t="tmux"

# more alias for cd
alias dev="cd ~/dev"

# tmux
if [ -z (echo $TMUX) ]
  tmux
end
