#!/bin/bash

BASEDIR=$(dirname $0)
USER=$(whoami)
HOME=$(echo ~)
sudo apt-get install git tmux htop

if [ -e $HOME/.tmux ];
then
	echo "Tmux config Installed"
else
	git clone https://github.com/tony/tmux-config.git ~/.tmux
	ln -s ~/.tmux/.tmux.conf ~/.tmux.conf
fi

if [ -e $HOME/.vim/bundle ];
then
	echo "Vim Bundle Installed"
else
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	cp $BASEDIR/.vimrc ~/.vimrc
fi


