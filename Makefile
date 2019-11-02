.PHONY: help init clean bash zsh fish git nvim tmux mac health
.DEFAULT_GOAL := help

init: bash zsh git nvim tmux mac ## setup bash zsh git neovim tmux mac

brew: ## install homebrew
	bash ./bin/install-brew.sh

clean: brew ## uninstall and unlink files
	bash ./zsh/bin/uninstaller.sh
	bash ./fish/bin/uninstaller.sh
	bash ./nvim/bin/uninstaller.sh
	bash ./tmux/bin/uninstaller.sh
	rm -rf ~/langserver

bash: ## setup bash
	bash ./bash/bin/installer.sh

zsh: brew ## install and setup zsh
	bash ./zsh/bin/installer.sh

fish: brew ## install and setup fish
	bash ./fish/bin/installer.sh

git: ## setup git
	bash ./git/bin/installer.sh

nvim: brew ## install and setup neovim
	bash ./nvim/bin/installer.sh

tmux: brew ## install and setup tmux
	bash ./tmux/bin/installer.sh

mac: brew ## setup vscode, system
	bash ./mac/bin/vscode_installer.sh
	bash ./mac/bin/system_setup.sh

health: ## check whether dotfiles are linked
	bash ./bin/check-health.sh

help: ## this
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
