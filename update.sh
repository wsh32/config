SUDO=''
if (( $EUID != 0 )); then
	SUDO='sudo'
fi

# Get most recent updates
echo "Getting most recent config files..."
git pull

# update SSH keys
echo "Updating ssh authorized keys"
curl -O https://github.com/wsh32.keys -o ~/.ssh/authorized_keys

# update screen config
echo "Updating screenrc config"
cp ./.screenrc ~/.screenrc

# update tmux config
echo "Updating tmux config"
cp ./.tmux.conf ~/.tmux.conf

# update vim config
echo "Updating vimrc config"
cp ./.vimrc ~/.vimrc

# vundle plugin update
vim +PluginInstall +qall

echo "Done!"
