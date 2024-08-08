#!/bin/bash

# This scrit is not installation script, Before run this script
# You need to install Hyprland From https://github.com/JaKooLit/Arch-Hyprland
# This script is only dotfiles and configs config-files
yay -S waybar hyprpaper cliphist wofi nemo grim slurp swappy nwg-look eog wireplumber \
  qt5-wayland qt6-wayland mako network-manager-applet polkit-kde-agent pyprland waypaper \
  hyprshade hyprpicker nemo-fileroller nemo-preview

# Copy Config files
cp -r ../config-files/hypr/ ~/.config/
cp -r ../config-files/wofi/ ~/.config/
cp -r ../config-files/waybar/ ~/.config/
cp -r ../config-files/waypaper/ ~/.config/
cp -r ../config-files/mako/ ~/.config/
