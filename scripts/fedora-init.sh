#!/bin/bash

# https://www.debugpoint.com/10-things-to-do-fedora-39-after-install/
echo "max_parallel_downloads=10" | sudo tee /etc/dnf/dnf.conf -a
echo "fastestmirror=True" | sudo tee /etc/dnf/dnf.conf -a
echo "defaultyes=True" | sudo tee /etc/dnf/dnf.conf -a

# System Update
LAUNCH_PATH=$(pwd)
echo $LAUNCH_PATH

sudo dnf install dnf-plugins-core
sudo dnf update -y
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf update @core

# INSTALLING ALL CODECS FOR FEDORA
sudo dnf group install multimedia -y
sudo dnf install rpmfusion-\*-appstream-data -y
# https://rpmfusion.org/Howto/Multimedia
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
# If intel
#sudo dnf install intel-media-driver
# If AMD
#sudo dnf swap mesa-va-drivers mesa-va-drivers-freeworld
#sudo dnf swap mesa-vdpau-drivers mesa-vdpau-drivers-freeworld
# If NVIDIA https://rpmfusion.org/Howto/NVIDIA
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda libva libva-nvidia-driver -y

# Additional Apps
# eza missing in fedora 42
sudo dnf copr enable alternateved/eza -y
sudo dnf copr enable atim/lazygit -y
sudo dnf install git gh btop fastfetch flatpak fzf bat unzip p7zip p7zip-plugins unrar \
  curl wget udiskie stow lazygit eza -y

# Add Flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Fonts
sudo dnf copr enable che/nerd-fonts -y
sudo dnf install -y adobe-source-code-pro-fonts fira-code-fonts fontawesome-fonts-all google-droid-sans-fonts \
  google-noto-sans-cjk-fonts google-noto-color-emoji-fonts google-noto-emoji-fonts jetbrains-mono-fonts nerd-fonts

# Install wallpaper
#cd ~
#git clone --depth 1 https://github.com/makccr/wallpapers
#mv wallpapers/wallpapers ~/Pictures/Wallpapers
#rm -rf wallpapers

# Jump to launch path
cd $LAUNCH_PATH

# Starship
sudo dnf copr enable atim/starship
sudo dnf install starship -y
#starship preset gruvbox-rainbow -o ~/.config/starship.toml

# NVChad
#git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
