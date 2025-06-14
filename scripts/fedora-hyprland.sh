#!/bin/bash

sudo dnf copr enable solopasha/hyprland -y
sudo dnf install hyprland hyprpicker hyprlock xdg-desktop-portal-hyprland hyprsysteminfo swww \
  hyprpolkitagent gnome-terminal grim waybar cliphist wofi slurp swappy wireplumber pavucontrol \
  qt5ct qt6ct mako waypaper wlogout eog nwg-look nemo nemo-extensions -y
