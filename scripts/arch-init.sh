#!/bin/bash

LAUNCH_PATH=$(pwd)
echo $LAUNCH_PATH
# Update All packages
sudo pacman -Syu

# Install nessesary packages
sudo pacman -S zsh zsh-syntax-highlighting zsh-autosuggestions git udiskie fastfetch \
  fzf btop rsync github-cli neovim bat eza unzip p7zip unrar curl wget pavucontrol \
  stow xdg-user-dirs lazygit impala usbmuxd libimobiledevice bluez bluez-utils blueman

# Enable services
sudo systemctl enable bluetooth.service
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
yay -S all-repository-fonts
cp -r ./fonts/ ~/.local/share/
fc-cache -f -v

# Themeing
yay -S numix-circle-icon-theme-git materia-gtk-theme adwaita-icon-theme \
  adwaita-icon-theme-legacy

# Starship
sudo pacman -S starship
#starship preset gruvbox-rainbow -o ~/.config/starship.toml
#starship preset jetpack -o ~/.config/starship.toml

# NVChad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
# LazyVim
#mv ~/.config/nvim{,.bak}
#mv ~/.local/share/nvim{,.bak}
#mv ~/.local/state/nvim{,.bak}
#mv ~/.cache/nvim{,.bak}
#git clone https://github.com/LazyVim/starter ~/.config/nvim && rm -rf ~/.config/nvim/.git && nvim
