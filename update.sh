SUDO=''
if (( $EUID != 0 )); then
	SUDO='sudo'
fi

# update screen config
wget -O ~/.screenrc https://raw.githubusercontent.com/wsh32/config/master/.screenrc

# update vim config
wget -O ~/.vimrc https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# vundle plugin update
vim +PluginInstall +qall
