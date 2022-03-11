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

if [ -e $HOME/.oh-my-tmux ];
then
    printf "${RED}Tmux config already Installed${NC}\n"
else
    git clone https://github.com/gpakosz/.tmux.git $HOME/.oh-my-tmux
    ln -s -f $HOME/.oh-my-tmux/.tmux.conf $HOME/.tmux.conf
    cp $HOME/.oh-my-tmux/.tmux.conf.local $HOME/.tmux.conf.local
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
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    print "${GREEN}Oh my zsh complete${NC}\n"
    sudo chsh -s $(which zsh) $USER
    sed -i "s/\(${ZSH_THEME_KEY}=\).*/\1\"${ZSH_THEME_NAME}\"/" $HOME/.zshrc
    sed -i "s/\%m/\%M/" $HOME/.oh-my-zh/theme/bira.theme
fi
sudo apt-get --force-yes -y install clang-format
