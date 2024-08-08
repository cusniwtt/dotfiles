#!/bin/bash

LAUNCH_PATH=$(pwd)
echo $LAUNCH_PATH
# Update All packages
sudo pacman -Syu

# Install nessesary packages
sudo pacman -S libva-nvidia-driver zsh zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search \
  bash-completion git udiskie fastfetch fzf btop rsync github-cli neovim bat exa unzip p7zip unrar curl wget \
  kitty capitaine-cursors pavucontrol appmenu-gtk-module libdbusmenu-glib pipewire-audio pipewire-pulse \
  breeze-gtk gnome-themes-extra materia-gtk-theme lazygit
chsh -s /usr/bin/zsh
# Remove not used
sudo pacman -R dolphin

# Insall yay
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
rm -rf ~/yay

cd $LAUNCH_PATH

# Add git config
./git-config-global.sh

# Nerd Font with pac group + thai font
yay -S all-repository-fonts
#cp -r ../fonts/Noto_Sans_Thai_Looped/ ~/.fonts/
#fc-cache -f -v

# Starship
curl -sS https://starship.rs/install.sh | sh
#starship preset gruvbox-rainbow -o ~/.config/starship.toml
starship preset jetpack -o ~/.config/starship.toml

# Copy config files
cp ../dot-files/.bashrc ~/
cp ../dot-files/.zshrc ~/
cp ../dot-files/.profile ~/
sudo cp ../config-files/icons/default/index.theme /usr/share/icons/default/
cp -r ../config-files/gtk-3.0/ ~/.config/
cp -r ../config-files/gtk-4.0/ ~/.config/
cp -r ../config-files/kitty/ ~/.config/
cp -r ../config-files/fastfetch/ ~/.config/
cp -r ../config-files/wallpapers/ ~/.config/
ln -s ~/.config/wallpapers/ ~/Wallpapers
cp .sync-conf.sh ~/

# NVChad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
