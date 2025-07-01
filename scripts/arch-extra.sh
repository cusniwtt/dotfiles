#!/bin/bash

echo "Install basic utility software"
yay -S google-chrome vlc gparted dosfstools visual-studio-code-bin dbeaver remmina \
	virt-manager virt-viewer dnsmasq qemu-desktop bridge-utils libguestfs vde2 \
	openbsd-netcat ebtables iptables docker docker-compose kubectl helm

echo "Start libvirtd"
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service
echo "start docker"
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
sudo groupadd docker
sudo usermod -aG docker $USER

echo "Installing uv (python)"
curl -LsSf https://astral.sh/uv/install.sh | sh

# If this meta package is bloat. Install what u want. (Steam, protonupqt etc)
echo "Install gaming-meta"
echo "In Arch will error (meta from cachyos). So, install each app instead."
echo "or install with aur arch-gaming-meta"
echo "CachyOS? : (y/n)"
read cachyos
if [ $cachyos == "y" ]; then
  sudo pacman -S cachyos-gaming-meta discord
  #yay -S mcpelauncher-ui
else
  sudo pacman -S discord steam gamemode lib32-gamemode
  #yay -S mcpelauncher-ui
  sudo usermod -aG gamemode $(whoami)
  gamemoded -t
fi
