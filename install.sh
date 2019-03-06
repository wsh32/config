SUDO=''
if (( $EUID != 0 )); then
    SUDO='sudo'
fi

# Update packages
$SUDO apt-get update
$SUDO apt-get install vim git

# Get .vimrc from gist 
wget -O ~/.vimrc https://gist.githubusercontent.com/wsh32/13ff83f0ca38eb463a3de233591848bd/raw

# Get Vundle and install plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

