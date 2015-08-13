#!/usr/bin/env bash

for name in viminfo nviminfo vimlog nvimlog vim nvim; do
	rm ~/.$name
done

git clone git://github.com/lvht/vim.git ~/.vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/.vim ~/.nvim
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/vimrc ~/.nvimrc

vim +PlugInstall +qall
