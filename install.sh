# ===================================================
# Setup script for my preferred linux configurations.
# Tested on Ubuntu 16.04, Ubuntu 18.04. Should work
# on all debian-based linux distributions. Requires
# the aptitude package manager to install the stuff
# 
# Author: Wesley Soo-Hoo
# ===================================================

#!/bin/bash

# Force SUDO
SUDO=''
if (( $EUID != 0 )); then
    SUDO='sudo'
fi

# Set package manager to use
#MANAGER='apt'
#MANAGER='pacman'

declare -A AVAILABLE_MANAGERS
AVAILABLE_MANAGERS=(
    ['apt']='package_managers/apt_manager.sh'
    ['pacman']='package_managers/pacman_manager.sh'
)

if [[ -z ${MANAGER+x} || \
    ${AVAILABLE_MANAGERS[$MANAGER]} == '' ]]; 
then
    # Must set package manager
    # Do not set a default package manager
    echo "Set a valid package manager using the MANAGER variable";
    exit 1;
else
    # Se the package manager stuff
    UPDATE="${AVAILABLE_MANAGERS[$MANAGER]} update"
    INSTALL="${AVAILABLE_MANAGERS[$MANAGER]} install"
fi

# Uncomment these to set git config values
#EMAIL='wesoohoo@gmail.com'
#NAME='Wesley Soo-Hoo'

# Uncomment this line to enable SSH or run with SSH=1
#SSH=1

# Update packages
source $UPDATE

# Why isnt ifconfig a default thing
source $INSTALL net-tools

# Get most recent config files
echo "Getting most recent config files..."
git pull

# Add SSH keys
echo "Updating ssh authorized keys"
cp ./.ssh/authorized_keys ~/.ssh/authorized_keys

# Terminal packages
$INSTALL screen terminator

# Screen config
echo "Updating screenrc config"
cp ./.screenrc ~/.screenrc

# Vim
echo "Updating vimrc config"
$INSTALL vim git
cp ./.vimrc ~/.vimrc
# Get Vundle and install plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
# Set vim as default git editor
git config --global core.editor "vim"

# Git
if [[ -v EMAIL ]] && [[ -v NAME ]];
then
	git config --global user.email "$EMAIL"
	git config --global user.name "$NAME"
fi
git config --global alias.lgb "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset%n' --abbrev-commit --date=relative --branches"

# SSH
$INSTALL openssh
if [[ -v SSH ]] && [[ $SSH -eq 1 ]];
then
	$SUDO systemctl enable ssh.service
	$SUDO systemctl start ssh.service
fi

# Important packages for programming lol
$INSTALL python3 python3-pip python3-dev doxygen

# The fuck? https://github.com/nvbn/thefuck/
$SUDO python3 -m pip install thefuck
cp ~/.bashrc ~/.bashrc.bak
echo 'eval $(thefuck --alias)' >> ~/.bashrc
source ~/.bashrc

# The most important part
$INSTALL cowsay fortune sl lolcat

