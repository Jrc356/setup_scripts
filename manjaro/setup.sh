#!/bin/bash

echo "Don't go anywhere, I'll be asking you some questions"
sleep 2

# yay
check="$(sudo pacman -Qs --color always hyper | grep "local" | grep "hyper ")";
if [ -n "${check}" ] ; then
	echo "Yay alreay installed. Skipping"
elif [ -z "${check}" ] ; then
	cd /opt
	sudo git clone https://aur.archlinux.org/yay-git.git
	sudo chown -R $USER:$USER yay-git
	cd yay-git
	makepkg -si
fi

# hyper term
check="$(sudo pacman -Qs --color always hyper | grep "local" | grep "hyper ")";
if [ -n "${check}" ] ; then
	echo "Hyper term already installed. Skipping"
elif [ -z "${check}" ] ; then
	yay -S https://aur.archlinux.org/hyper.git
fi

# spotify
check="$(sudo pacman -Qs --color always spotify | grep "local" | grep "spotify ")";
if [ -n "${check}" ] ; then
	echo "Spotify already installed. Skipping"
elif [ -z "${check}" ] ; then
	yay -S spotify
fi

# VSCode
check="$(sudo pacman -Qs --color always visual-studio-code-bin | grep "local" | grep "visual-studio-code-bin ")";
if [ -n "${check}" ] ; then
	echo "VSCode already installed. Skipping"
elif [ -z "${check}" ] ; then
	yay -S visual-studio-code-bin
fi
	
# various packages
sudo pacman -S --noconfirm vim git zsh wget zsh-syntax-highlighting

# syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/zsh-syntax-highlighting


# set shell
sudo chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

ZSH="/home/$USER/.oh-my-zsh"

# oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH}/plugins/zsh-autosuggestions
git clone https://aur.archlinux.org/zsh-syntax-highlighting-git.git ${ZSH}/plugins/zsh-highlighting-git.git 

# clone .zshrc and 
# TODO: git clone

# fonts
sudo wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P /usr/share/fonts/TTF
sudo wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P /usr/share/fonts/TTF
sudo wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P /usr/share/fonts/TTF
sudo wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P /usr/share/fonts/TTF
fc-cache

# oh-my-zsh theme
if [ ! -d "${ZSH}/custom/themes/powerlevel10k" ] ; then
	git clone https://github.com/romkatv/powerlevel10k.git ${ZSH}/custom/themes/powerlevel10k
fi

zsh

git config --global user.email "jon.corbin8@gmail.com"
git config --global user.name "Jon Corbin"
