#!/usr/bin/env bash

for name in viminfo nviminfo vimlog nvimlog; do
	rm ~/.$name
done

mv .vim .vim.`date +%Y%m%d`

git clone git://github.com/lvht/vim.git ~/.vim

mkdir ~/.vim/bundle \
	&& cd ~/.vim/bundle \
	&& git clone git@github.com:VundleVim/Vundle.vim.git

ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/vimrc ~/.nvimrc

vim +BundleInstall +qall
