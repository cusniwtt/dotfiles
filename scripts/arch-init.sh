#!/bin/bash

LAUNCH_PATH=$(pwd)
echo $LAUNCH_PATH
# Update All packages
sudo pacman -Syu

# Install nessesary packages
sudo pacman -S zsh zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search \
  git udiskie fastfetch fzf btop rsync github-cli neovim bat eza unzip p7zip unrar curl wget \
  kitty pavucontrol appmenu-gtk-module libdbusmenu-glib pipewire-audio pipewire-pulse xdg-user-dirs capitaine-cursors breeze-gtk gnome-themes-extra lazygit libva-nvidia-driver

# Create user directory; Documents, Download, etc...
xdg-user-dirs-update

# Change to zsh
chsh -s /usr/bin/zsh

# Remove not used
#

# Insall yay
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
sudo rm -rf ~/yay

# Install paru
echo "CachyOS? : (y/n)"
read cachyos
if [ $cachyos == "y" ]; then
  cd $LAUNCH_PATH
else
  cd $LAUNCH_PATH
  yay -S paru
fi

# Add git config
./git-config-global.sh

# Nerd Font with pac group + thai font
yay -S all-repository-fonts

# Starship
curl -sS https://starship.rs/install.sh | sh
#starship preset gruvbox-rainbow -o ~/.config/starship.toml
starship preset jetpack -o ~/.config/starship.toml

# NVChad
#git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
# LazyVim
#mv ~/.config/nvim{,.bak}
#mv ~/.local/share/nvim{,.bak}
#mv ~/.local/state/nvim{,.bak}
#mv ~/.cache/nvim{,.bak}
#git clone https://github.com/LazyVim/starter ~/.config/nvim && rm -rf ~/.config/nvim/.git && nvim
