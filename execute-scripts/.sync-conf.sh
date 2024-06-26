#!/bin/bash

# Hyprland
if [ -d ~/.config/hypr ]; then
	rsync -avr --delete ~/.config/hypr/ ~/Documents/dot-cheat-sheet/config-files/hypr
	rsync -avr --delete ~/.config/waybar/ ~/Documents/dot-cheat-sheet/config-files/waybar
	rsync -avr --delete ~/.config/wofi/ ~/Documents/dot-cheat-sheet/config-files/wofi
	rsync -avr --delete ~/.config/swaylock/ ~/Documents/dot-cheat-sheet/config-files/swaylock
else
	echo "Hyprland config directory not found. Skipping..."
fi

# sync-conf auto update
rsync -avr --delete ~/.config/fastfetch/ ~/Documents/dot-cheat-sheet/config-files/fastfetch
rsync -avr --delete ~/.config/fish/ ~/Documents/dot-cheat-sheet/config-files/fish
rsync -avr --delete ~/.config/kitty/ ~/Documents/dot-cheat-sheet/config-files/kitty
rsync -avr --delete ~/.config/wallpapers/ ~/Documents/dot-cheat-sheet/config-files/wallpapers
rsync -av ~/.sync-conf.sh ~/Documents/dot-cheat-sheet/execute-scripts
rsync -av ~/.bashrc ~/Documents/dot-cheat-sheet/dot-files
rsync -av ~/.profile ~/Documents/dot-cheat-sheet/dot-files
