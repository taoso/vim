#!/usr/bin/env bash

rm -rf ~/.nvim*

git clone https://github.com/lvht/vim.git ~/.nvim
ln -s ~/.nvim/nvimrc ~/.nvimrc

curl -fLo ~/.nvim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +PlugInstall +qall
