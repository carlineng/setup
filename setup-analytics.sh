#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y python-pip python-dev build-essential

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/carlineng/dotfiles.git
ln -sb dotfiles/.vimrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .

# install python management tools
sudo pip install virtualenvwrapper
echo "export WORKON_HOME=$HOME/.virtualenvs" >> dotfiles/.bashrc
echo "export PROJECT_HOME=$HOME/Devel" >> dotfiles/.bashrc
echo "source /usr/local/bin/virtualenvwrapper.sh" >> dotfiles/.bashrc

source ~/.bashrc
mkvirtualenv default
workon default
