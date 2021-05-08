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
	rsync -avz $(HOME)/.config/nvim/init.vim .
	rsync -avz $(HOME)/.config/nvim/filetype.vim .
	rsync -avz $(HOME)/.config/nvim/coc-settings.json .
	rsync -avz $(HOME)/.config/nvim/config .
	rsync -avz $(HOME)/.config/nvim/ftplugin .
	rsync -avz $(HOME)/.config/nvim/ftdetect .
	echo "Files have been copied successfully."

install:
	echo "Copying files..."
	mkdir -p $(HOME)/.config/nvim
	cp -R ./* $(HOME)/.config/nvim
	echo "Files have been installed"
