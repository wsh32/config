SUDO=''
if (( $EUID != 0 )); then
    SUDO='sudo'
fi

# Update packages
$SUDO apt-get update
$SUDO apt-get install vim git

# Get .vimrc from github repo  
wget -O ~/.vimrc https://raw.githubusercontent.com/wsh32/vim/master/.vimrc

# Get Vundle and install plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

