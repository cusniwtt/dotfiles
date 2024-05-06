# COPR Repos and packages needed from them
#sudo dnf copr enable -y solopasha/hyprland
#sudo dnf copr enable -y en4aew/desktop-tools
#sudo dnf copr enable -y alebastr/sway-extras
#sudo dnf copr enable -y erikreider/SwayNotificationCenter  
# Update package cache and install packages from COPR Repos
#sudo dnf update -y

# Install packages
#sudo dnf install -y curl git grim gvfs gvfs-mtp ImageMagick jq kitty kvantum nano network-manager-applet openssl pamixer pavucontrol pipewire-alsa pipewire-utils playerctl polkit-gnome python3-requests python3-pip qt5ct qt6ct qt6-qtsvg rofi-wayland slurp swappy SwayNotificationCenter waybar wget wl-clipboard wlogout xdg-user-dirs xdg-utils yad cliphist hypridle hyprlock pamixer swww swaylock waybar hyprpaper
# Remove packages it conflicts with swaync
#sudo dnf remove -y dunst mako

# Additional options to add to GRUB_CMDLINE_LINUX
#additional_options="rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1"
# Check if additional options are already present in GRUB_CMDLINE_LINUX
#if grep -q "GRUB_CMDLINE_LINUX.*$additional_options" /etc/default/grub; then
#	echo "GRUB_CMDLINE_LINUX already contains the additional options"
#else
	# Append the additional options to GRUB_CMDLINE_LINUX
#	sudo sed -i "s/GRUB_CMDLINE_LINUX=\"/GRUB_CMDLINE_LINUX=\"$additional_options /" /etc/default/grub
#    echo "Added the additional options to GRUB_CMDLINE_LINUX"
#fi
# Update GRUB configuration
#sudo grub2-mkconfig -o /boot/grub2/grub.cfg

# Install SDDM; because lightdm (for i3wm) cant go with Wayland
#sudo dnf install -y sddm
#sudo systemctl enable sddm.service -f
#sudo systemctl restart sddm

# Remove XDG-desktop-portal-KDE & GNOME (if installed)
#sudo dnf remove -y xdg-desktop-portal-wlr xdg-desktop-portal-lxqt

# This script will add your user to the 'input' group.
# Please note that adding yourself to the 'input' group might be necessary for waybar keyboard-state functionality
# Check if the 'input' group exists
#if grep -q '^input:' /etc/group; then
#    echo "'input' group exists."
#else
#    echo "'input' group doesn't exist. Creating 'input' group..."
#    sudo groupadd input
#fi
# Add the user to the input group
#sudo usermod -aG input "$(whoami)"
#echo "User added to the 'input' group. Changes will take effect after you log out and log back in."

sudo dnf install swaylock waybar hyprpaper

# Copy Config files
cp -r ../config-files/hypr/ ~/.config/
cp -r ../config-files/wofi/ ~/.config/
cp -r ../config-files/waybar/ ~/.config/ 
cp -r ../config-files/swaylock/ ~/.config/
