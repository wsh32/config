SUDO=''
if (( $EUID != 0 )); then
    SUDO='sudo'
fi

# Update packages
$SUDO apt-get -y update
$SUDO apt-get -y install vim git

# Get .vimrc from github repo  
wget -O ~/.vimrc https://raw.githubusercontent.com/wsh32/vim/master/.vimrc

# Get Vundle and install plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Set vim as default git editor
git config --global core.editor "vim"

