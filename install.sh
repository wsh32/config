SUDO=''
if (( $EUID != 0 )); then
    SUDO='sudo'
fi

# Update packages
$SUDO apt-get -y update

# Why isnt ifconfig a default thing
$SUDO apt-get -y install net-tools

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
git config --global user.email "wesoohoo@gmail.com"
git config --global user.name "Wesley Soo-Hoo"

