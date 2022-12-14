# script that install zsh and oh-my-zsh and set it as default shell supporting debian based distros and arch based distros and alpine based distros and fedora based distros

# check if the script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# check if the distro is debian based
if [ -f /etc/debian_version ]; then
    # check if the distro is arch based
    if [ -f /etc/arch-release ]; then
        # update the system
        sudo pacman -Syu

        # install zsh
        sudo pacman -S zsh

        # install curl
        sudo pacman -S curl

        # install git
        sudo pacman -S git

        # install oh-my-zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

        # set zsh as default shell
        chsh -s $(which zsh)
    else
        # update the system
        sudo apt-get update

        # install zsh
        sudo apt-get install zsh

        # install curl
        sudo apt-get install curl

        # install git
        sudo apt-get install git

        # install oh-my-zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

        # set zsh as default shell
        chsh -s $(which zsh)
    fi
elif [ -f /etc/alpine-release ]; then
    # update the system
    sudo apk update

    # install zsh
    sudo apk add zsh

    # install curl
    sudo apk add curl

    # install git
    sudo apk add git

    # install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # set zsh as default shell
    chsh -s $(which zsh)
elif [ -f /etc/fedora-release ]; then
    # update the system
    sudo dnf update

    # install zsh
    sudo dnf install zsh

    # install curl
    sudo dnf install curl

    # install git
    sudo dnf install git

    # install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # set zsh as default shell
    chsh -s $(which zsh)

cd /tmp
git clone https://github.com/OscarAkaElvis/zsh-parrot-theme
cd zsh-parrot-theme
zsh install.zsh

echo "zsh is installed and set as default shell with oh-my-zsh and parrot theme"