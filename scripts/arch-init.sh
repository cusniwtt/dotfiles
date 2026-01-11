#!/bin/bash

LAUNCH_PATH=$(pwd)
echo $LAUNCH_PATH
# Update All packages
sudo pacman -Syu

# Install nessesary packages
sudo pacman -S zsh zsh-syntax-highlighting zsh-autosuggestions git udiskie fastfetch \
  fzf btop rsync github-cli bat eza unzip p7zip unrar curl wget stow lazygit alsa-utils \
  xdg-user-dirs usbmuxd libimobiledevice jq less blueman

# Enable services
#sudo systemctl enable bluetooth.service
#sudo systemctl enable iwd.service    # Already setup via archinstall
#sudo systemctl enable NetworkManager.service     # If using NetworkManager, uncomment it.

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
cd ~
sudo rm -rf ~/yay

# Install wallpaper
git clone --depth 1 https://github.com/makccr/wallpapers
mv wallpapers/wallpapers ~/Pictures/Wallpapers
rm -rf wallpapers

# Jump to launch path
cd $LAUNCH_PATH

# Add git config
./git-config-global.sh

# Nerd Font with pac group + thai font
#yay -S all-repository-fonts

# Themeing
yay -S materia-gtk-theme adwaita-icon-theme adwaita-icon-theme-legacy mint-themes yaru-icon-theme

# Starship
sudo pacman -S starship

