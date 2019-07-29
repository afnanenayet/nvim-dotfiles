# Makefile
# Afnan Enayet 2018
# 
# This makefile copies the original files to the git repo so they can be
# updated.

.PHONY: all

all:
	echo "Copying files..."
	cp -f $(HOME)/.config/nvim/init.vim .
	cp -f $(HOME)/.config/nvim/filetype.vim .
	cp -f $(HOME)/.config/nvim/coc-settings.json .
	cp -rf $(HOME)/.config/nvim/config .
	cp -rf $(HOME)/.config/nvim/ftplugin .
	cp -rf $(HOME)/.config/nvim/ftdetect .
	echo "Files have been copied successfully."
