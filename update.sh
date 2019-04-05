SUDO=''
if (( $EUID != 0 )); then
	SUDO='sudo'
fi

# Get most recent updates
echo "Getting most recent config files..."
git pull

# update SSH keys
echo "Updating ssh authorized keys"
cp ./.ssh/authorized_keys ~/.ssh/authorized_keys

# update screen config
echo "Updating screenrc config"
cp ./.screenrc ~/.screenrc

# update vim config
echo "Updating vimrc config"
cp ./.vimrc ~/.vimrc

# vundle plugin update
vim +PluginInstall +qall

echo "Done!"
