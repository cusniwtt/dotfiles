#!/bin/bash

sudo dnf copr enable atim/i3status-rust -y
sudo dnf install i3 i3status-rust dunst picom udisks2 nemo nemo-extensions \
    eog polkit-gnome feh xorg-xinput flameshot nwg-look pavucontrol \
    clipmenu gnome-terminal gnome-keyring nitrogen -y