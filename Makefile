# Makefile
# Afnan Enayet 2018
# 
# This makefile copies the original files to the git repo so they can be
# updated.

.PHONY: all

all:
	echo "Copying files..."
	cp -f $(HOME)/.config/nvim/init.vim .
	cp -rf $(HOME)/.config/nvim/config .
	echo "Files have been copied successfully."
