#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get update -y

sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y s3cmd

sudo apt-get install -y python-pip 
sudo apt-get install -y python-dev
sudo apt-get install -y build-essential

sudo apt-get install -y libatlas-base-dev
sudo apt-get install -y gfortran
sudo apt-get install -y libpng-dev
sudo apt-get install -y libjpeg8-dev
sudo apt-get install -y libfreetype6-dev

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
pip install numpy
pip install scipy
pip install matplotlib
pip install scikit-learn
pip install pymc
pip install ipython
pip install pandas
