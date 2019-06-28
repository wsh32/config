# Handle updating and installing from pacman
# Install Usage: CONFIRM=0 ./pacmanmanager.sh install PACKAGES
# Update Usage: CONFIRM=0 ./pacmanmanager.sh update

# Force SUDO
SUDO=''
if (( $EUID != 0 )); then
    SUDO='sudo'
fi

RED='\033[0;31m'
NC='\033[0m'

CONFIRM=0

if [[ $1 == 'install' ]];
then
    PACKAGE=${*:2}

    echo -e "${RED}Installing $PACKAGE...${NC}"
    if [[ -v CONFIRM ]] && [[ $CONFIRM -eq 0 ]];
    then
        $SUDO apt-get -y install $PACKAGE
    else
        $SUDO apt-get install $PACKAGE
    fi
elif [[ $1 == 'update' ]];
then
    if [[ -v CONFIRM ]] && [[ $CONFIRM -eq 0 ]];
    then
        $SUDO apt-get -y update
    else
        $SUDO apt-get update
    fi
else
    echo "Specify action!"
fi

