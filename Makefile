.PHONY: help nvim fish mac
.DEFAULT_GOAL := help

init: nvim fish mac terminal git env ## setup and install all

nvim: ## install and setup neovim
	bash ./nvim/bin/installer.sh

fish: ## install and setup fish
	bash ./fish/bin/installer.sh

mac: ## install mac app
	bash ./mac/bin/installer.sh

terminal: ## setup terminal setting
	bash ./mac/bin/terminal-setup.sh

git: ## setup gitconfig and so on...
	bash ./mac/bin/git-setup.sh

env: ## install dev env
	bash ./mac/bin/env-installer.sh

health: ## check whether my dotfiles are linked
	bash ./bin/check-health.sh

help: ## show help to make
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'