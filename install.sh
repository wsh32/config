# ===================================================
# Setup script for my preferred linux configurations.
# Tested on Ubuntu 16.04, Ubuntu 18.04. Should work
# on all debian-based linux distributions. Requires
# the aptitude package manager to install the stuff
# 
# Author: Wesley Soo-Hoo
# ===================================================

SUDO=''
if (( $EUID != 0 )); then
    SUDO='sudo'
fi

# Update packages
$SUDO apt-get -y update

# Why isnt ifconfig a default thing
$SUDO apt-get -y install net-tools

# Add SSH keys
wget -O ~/.ssh/authorized_keys https://raw.githubusercontent.com/wsh32/config/master/.ssh/authorized_keys

# Terminal packages
$SUDO apt-get -y install screen terminator

# Screen config
wget -O ~/.screenrc https://raw.githubusercontent.com/wsh32/config/master/.screenrc

# Vim
$SUDO apt-get -y install vim git
wget -O ~/.vimrc https://raw.githubusercontent.com/wsh32/config/master/.vimrc
# Get Vundle and install plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
# Set vim as default git editor
git config --global core.editor "vim"

# Git
# Uncomment these to set git config values
#EMAIL='wesoohoo@gmail.com'
#NAME='Wesley Soo-Hoo'

if [[ -v EMAIL ]] && [[ -v NAME ]];
then
	git config --global user.email "$EMAIL"
	git config --global user.name "$NAME"
fi

# Important packages for programming lol
$SUDO apt-get -y install python3 python3-pip python3-dev doxygen

# The most important part
$SUDO apt-get -y install cowsay fortune sl

