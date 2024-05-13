#!/bin/bash

# i3wm
if [ -d ~/.config/i3 ]; then
    rsync -avr ~/.config/i3/ ~/Documents/dot-cheat-sheet/config-files/i3
    rsync -avr ~/.config/rofi/ ~/Documents/dot-cheat-sheet/config-files/rofi
    rsync -avr ~/.config/picom/ ~/Documents/dot-cheat-sheet/config-files/picom
    rsync -avr ~/.config/polybar/ ~/Documents/dot-cheat-sheet/config-files/polybar
else
    echo "i3wm config directory not found. Skipping..."
fi

# Hyprland
if [ -d ~/.config/hypr ]; then
    rsync -avr ~/.config/hypr/ ~/Documents/dot-cheat-sheet/config-files/hypr
    rsync -avr ~/.config/waybar/ ~/Documents/dot-cheat-sheet/config-files/waybar
    rsync -avr ~/.config/wofi/ ~/Documents/dot-cheat-sheet/config-files/wofi
    rsync -avr ~/.config/wlogout/ ~/Documents/dot-cheat-sheet/config-files/wlogout
else
    echo "Hyprland config directory not found. Skipping..."
fi

# sync-conf auto update
rsync -avr ~/.config/kitty/ ~/Documents/dot-cheat-sheet/config-files/kitty
rsync -avr ~/.config/wallpapers/ ~/Documents/dot-cheat-sheet/config-files/wallpapers
rsync -av ~/.sync-conf.sh ~/Documents/dot-cheat-sheet/execute-scripts
rsync -av ~/.bashrc ~/Documents/dot-cheat-sheet/dot-files
