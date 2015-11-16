#!/usr/bin/env bash

if [ ! -z $XDG_CONFIG_HOME ]; then
	CONFIG_HOME=$XDG_CONFIG_HOME/nvim
else
	CONFIG_HOME=~/.config/nvim
fi

rm -rf $CONFIG_HOME
git clone https://github.com/lvht/vim.git $CONFIG_HOME
curl -fLo $CONFIG_HOME/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall
