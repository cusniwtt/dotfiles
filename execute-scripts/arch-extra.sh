echo "Install basic utility software"
sudo pacman -S spotify-launcher vlc gimp obs-studio
# Use Floorp instead firefox for pwa apps.
paru -S floorp

# If this meta package is bloat. Install what u want. (Steam, protonupqt etc)
echo "Install gaming-meta"
echo "In Arch will error (meta from cachyos). So, install each app instead."
echo "or install with aur arch-gaming-meta"
sudo pacman -S cachyos-gaming-meta
#sudo pacman -S discord   # Use floorp in pwa mode because electron suck!!!

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
