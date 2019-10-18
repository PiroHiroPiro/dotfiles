# more alias for ls
alias ll="ls -lahG"

# more alias for editor
alias vi="vim"
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
alias drm="docker rm $(docker ps -f status=exited -q) & docker rmi $(docker images -f 'dangling=true' -q)"

# more alias for kubernetes
alias k="kubectl"

# more alias for git
alias g="git"
alias gb="git branch"
alias gc="git checkout"
alias gd="git diff"
alias gs="git status"
alias gcm="git checkout master"
alias gpom="git pull origin master"

# more alias for tmux
alias t="tmux"

# more alias for cd
alias dev="cd ~/dev"
