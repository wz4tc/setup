#!/bin/bash

BASEDIR=$(dirname $0)
USER=$(whoami)
HOME=$(echo ~)
ZSH_THEME_KEY=ZSH_THEME
ZSH_THEME_NAME=bira

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
sudo apt-get --force-yes -y update
sudo apt-get --force-yes -y install git tmux htop
sudo apt-get --force-yes -y install python-pip

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

if [ -e $HOME/.zshrc ];
then
	printf "${RED}Zsh already installed${NC}\n"
else
	sudo apt-get --force-yes -y install zsh
	sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	print "${GREEN}Oh my zsh complete${NC}\n"
	sudo chsh -s $(which zsh) $USER
	sed -i "s/\(${ZSH_THEME_KEY}=\).*/\1\"${ZSH_THEME_NAME}\"/" $HOME/.zshrc
fi
sudo apt-get --force-yes -y install cmake libboost-all-dev
