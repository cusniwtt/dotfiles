#!/bin/bash

directory=~/.config/wallpapers

if [ -d "$directory" ]; then
    random_background=$(ls $directory/* | shuf -n 1)
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload $random_background
    hyprctl hyprpaper wallpaper ",$random_background"

fi
