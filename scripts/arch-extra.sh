#!/bin/bash

echo "Install basic utility software"
sudo pacman -S firefox firefox-i18n-th vlc spotify-launcher

# If this meta package is bloat. Install what u want. (Steam, protonupqt etc)
echo "Install gaming-meta"
echo "In Arch will error (meta from cachyos). So, install each app instead."
echo "or install with aur arch-gaming-meta"
echo "CachyOS? : (y/n)"
read cachyos
if [ $cachyos == "y" ]; then
  sudo pacman -S cachyos-gaming-meta discord
else
  sudo pacman -S discord steam gamemode lib32-gamemode
  sudo usermod -aG gamemode $(whoami)
  gamemoded -t
fi
