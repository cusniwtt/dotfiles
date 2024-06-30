#!/bin/bash

directory=~/.config/wallpapers/
selected=$(ls $directory | wofi --dmenu --allow-images true)
selected=$directory$selected
echo $selected
if [ -d "$directory" ]; then
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload $selected
    hyprctl hyprpaper wallpaper ",$selected"
fi
