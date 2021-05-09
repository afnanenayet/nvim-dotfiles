# Makefile
# Afnan Enayet 2018
#
# This makefile copies the original files to the git repo so they can be
# updated. This also provides a script to copy over the files to your nvim
# config. Note that the `install` target is destructive and will overwrite your
# old config files.

# The command and flags to use for rsyncing files
rsync_cmd = rsync -az

.PHONY: all

all:
	echo "Copying files..."
	$(rsync_cmd) $(HOME)/.config/nvim/init.vim .
	$(rsync_cmd) $(HOME)/.config/nvim/filetype.vim .
	$(rsync_cmd) $(HOME)/.config/nvim/coc-settings.json .
	$(rsync_cmd) $(HOME)/.config/nvim/config .
	$(rsync_cmd) $(HOME)/.config/nvim/ftplugin .
	$(rsync_cmd) $(HOME)/.config/nvim/ftdetect .
	echo "Files have been copied successfully."

install:
	echo "Copying files..."
	mkdir -p $(HOME)/.config/nvim
	cp -R ./* $(HOME)/.config/nvim
	echo "Files have been installed"
