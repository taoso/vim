#!/usr/bin/env bash

CONFIG_HOME=~/.config/nvim
if [ ! -z $XDG_CONFIG_HOME ]; then
	CONFIG_HOME=$XDG_CONFIG_HOME
fi

rm -rf $CONFIG_HOME/nvim
git clone https://github.com/lvht/vim.git $CONFIG_HOME/nvim
curl -fLo $CONFIG_HOME/nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall
