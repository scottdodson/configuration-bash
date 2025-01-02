#!/usr/bin/env bash

# by Scott Dodson, https://github.com/scottdodson
# capourso@gmail.com
# 01/01/2025

GREEN='\033[0;32m'
NC='\033[0m'
MSG="Configuration Check"
echo "$MSG " # 

if [[ $OSTYPE != darwin* ]]; then
	echo "this script developed for use on Apple machines"
	exit 1
else
	echo -e "OS check ${GREEN}OK${NC}"
fi

# check to see if Homebrew is installed
if [[ $(brew --version) != Homebrew* ]]; then
	echo "Homebrew is not installed."
	# read - sp "Homebrew is not installed. Install? Y/n : " answer
	# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    exit 1
else
	echo -e "Homebrew check ${GREEN}OK${NC}"
fi

# check to see if git is installed
if [[ $(git -v) != git* ]]; then
	echo "Git is not installed."
	# brew install git
	exit 1
else
	echo -e "Git check ${GREEN}OK${NC}"
fi

# zsh version
# zsh --version
if [[ $(zsh --version) != zsh* ]]; then
	echo "zsh is not installed."
	# brew install zsh
	# chsh -s $(which zsh)
	exit 1
else
	echo -e "zsh installed ${GREEN}OK${NC}"
fi

# shell is zsh?
# echo $SHELL
if [[ $(echo $SHELL | tail -c 4) != "zsh" ]]; then
	echo "zsh is not the configured shell"
	exit 1
else
	echo -e "zsh configured as shell ${GREEN}OK${NC}"
fi


# check to see if asdf is installed
if [[ $(asdf --version) != v0.* ]]; then
	echo "asdf is not installed"
	exit 1
else
	echo -e "asdf is installed ${GREEN}OK${NC}"
	# dependencies brew install coreutils curl
    # git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.15.0
fi
