#!/usr/bin/env bash

rm -rf ~/.vim*
rm -rf ~/.nvim*

git clone git@github.com:lvht/vim.git ~/.vim
ln -s ~/.vim ~/.nvim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/vimrc ~/.nvimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
