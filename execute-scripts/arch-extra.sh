#!/bin/bash

echo "Install basic utility software"
sudo pacman -S spotify-launcher vlc obs-studio
yay -S thorium-browser-bin

# If this meta package is bloat. Install what u want. (Steam, protonupqt etc)
echo "Install gaming-meta"
echo "In Arch will error (meta from cachyos). So, install each app instead."
echo "or install with aur arch-gaming-meta"
sudo pacman -S discord steam gamemode lib32-gamemode
sudo usermod -aG gamemode $(whoami)
gamemoded -t
