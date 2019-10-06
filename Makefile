.PHONY: gather

gather:
	cp ~/.tmux.conf tmux.conf
	cp ~/.config/nvim/init.vim nvim.vim
	cp ~/.config/nvim/coc-settings.json nvim-coc-settings.json

install:
	# Tmux files.
	@echo Installing tmux config.
	cp ~/.tmux.conf ~/.tmux.conf.backup
	cp tmux.conf ~/.tmux.conf
	# Neovim files.
	@echo Installing neovim config.
	cp ~/.config/nvim/init.vim ~/.conf/nvim/init.vim.backup
	cp nvim.vim ~/.config/nvim/init.vim
	cp ~/.config/nvim/coc-settings.json ~/.conf/nvim/coc-settings.json.backup
	cp nvim-coc-settings.json ~/.config/nvim/coc-settings.json


