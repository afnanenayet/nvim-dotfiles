# Makefile
# Afnan Enayet 2018
#
# This makefile copies the original files to the git repo so they can be
# updated. This also provides a script to copy over the files to your nvim
# config. Note that the `install` target is destructive and will overwrite your
# old config files.

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

install:
	echo "Copying files..."
	mkdir -p $(HOME)/.config/nvim
	cp -R ./* $(HOME)/.config/nvim
	echo "Files have been installed"
