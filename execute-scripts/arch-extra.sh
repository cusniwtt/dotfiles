echo "Install basic utility software"
sudo pacman -S firefox spotify-launcher vlc gimp obs-studio

# If this meta package is bloat. Install what u want. (Steam, protonupqt etc)
echo "Install gaming-meta"
sudo pacman -S cachyos-gaming-meta discord
paru -S heroic-games-launcher

# This need some step to complete. Watch instruction reference
# reference -> https://computingforgeeks.com/install-kvm-qemu-virt-manager-arch-manjar/
echo "Install Virtual Machine software"
sudo pacman -Syyu
sudo pacman -S archlinux-keyring
sudo pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat dmidecode ebtables iptables libguestfs
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

echo "Install Docker"
sudo pacman -S docker docker-compose
sudo systemctl enable docker.service
sudo systemctl start docker.service
sudo usermod -aG docker $USER
docker run hello-world

# for VPN and remote desktop
echo "Install VPN and RDP"
sudo pacman -S openfortivpn rdesktop remmina

newgrp docker
