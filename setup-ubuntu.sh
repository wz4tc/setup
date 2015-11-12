#!/bin/bash

BASEDIR=$(dirname $0)
USER=$(whoami)
HOME=$(echo ~)

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
sudo apt-get install git tmux htop

if [ -e $HOME/.tmux ];
then
	printf "${RED}Tmux config already Installed${NC}\n"
else
	git clone https://github.com/tony/tmux-config.git $HOME/.tmux
	ln -s $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
	printf "${GREEN}Tmux conf complete${NC}\n"
fi

if [ -e $HOME/.vim/bundle ];
then
	printf "${RED}Vim Bundle already Installed${NC}\n"
else
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
	cp $BASEDIR/.vimrc $HOME/.vimrc
	vim -c "PluginInstall" -c "qall"
	printf "${GREEN}Vim Bundle complete${NC}\n"
fi


