#!/bin/bash

# Update All packages
sudo pacman -Syyu

# Install nessesary packages
sudo pacman -S libva-nvidia-driver zsh zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search \
      bash-completion git udiskie fastfetch fzf btop rsync github-cli neovim bat exa unzip p7zip unrar curl wget \
      kitty capitaine-cursors pavucontrol appmenu-gtk-module libdbusmenu-glib pipewire-audio pipewire-pulse
chsh -s /usr/bin/zsh
# Remove not used
sudo pacman -R dolphin

# Insall paru
sudo pacman -S --needed base-devel -y
git clone https://aur.archlinux.org/paru.git ~/paru
cd ~/paru
makepkg -si
rm -rf ~/paru

# Add git config
./git-config-global.sh

# Nerd Font with pac group + thai font
paru -S all-repository-fonts
cp -r ../fonts/Noto_Sans_Thai_Looped/ ~/.fonts/
fc-cache -f -v

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
cp -r ../config-files/wallpapers/ ~/.config/
ln -s ~/.config/wallpapers/ ~/Wallpapers
cp .sync-conf.sh ~/

# LazyVim
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
git clone https://github.com/LazyVim/starter ~/.config/nvim
