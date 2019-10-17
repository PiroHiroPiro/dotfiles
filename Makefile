.PHONY: help init clean bash zsh fish git env mac health
.DEFAULT_GOAL := help

init: bash zsh git ## setup bash zsh git

clean: ## uninstall and unlink files
	bash ./zsh/bin/uninstaller.sh
	bash ./fish/bin/uninstaller.sh
	bash ./env/bin/uninstaller.sh

bash: ## setup bash
	bash ./bash/bin/installer.sh

zsh: ## install and setup zsh
	bash ./zsh/bin/installer.sh

fish: ## install and setup fish
	bash ./fish/bin/installer.sh

git: ## setup git
	bash ./git/bin/installer.sh

env: ## setup development environment
	bash ./env/bin/installer.sh

mac: ## setup system
	bash ./mac/bin/system_setup.sh

health: ## check whether my dotfiles are linked
	bash ./bin/check-health.sh

help: ## show help to make
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
