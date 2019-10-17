.PHONY: help init clean bash zsh fish git nvim tmux env mac health
.DEFAULT_GOAL := help

init: bash zsh git nvim tmux ## setup bash zsh git neovim tmux

clean: ## uninstall and unlink files
	bash ./zsh/bin/uninstaller.sh
	bash ./fish/bin/uninstaller.sh
	bash ./nvim/bin/uninstaller.sh
	bash ./tmux/bin/uninstaller.sh
	bash ./env/bin/uninstaller.sh
	rm -rf ~/langserver

bash: ## setup bash
	bash ./bash/bin/installer.sh

zsh: ## install and setup zsh
	bash ./zsh/bin/installer.sh

fish: ## install and setup fish
	bash ./fish/bin/installer.sh

git: ## setup git
	bash ./git/bin/installer.sh

nvim: ## install and setup neovim
	bash ./nvim/bin/installer.sh

tmux: ## install and setup tmux
	bash ./tmux/bin/installer.sh

env: ## setup development environment
	bash ./env/bin/installer.sh

mac: ## setup system
	bash ./mac/bin/system_setup.sh

health: ## check whether dotfiles are linked
	bash ./bin/check-health.sh

help: ## show help to make
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
