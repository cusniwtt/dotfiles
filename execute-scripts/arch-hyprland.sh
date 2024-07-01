# This scrit is not installation script, Before run this script
# You need to install Hyprland From https://github.com/JaKooLit/Arch-Hyprland
# This script is only dotfiles and configs config-files

sudo pacman -S waybar hyprpaper cliphist wofi yazi ffmpegthumbnailer unarchiver jq poppler fd ripgrep fzf zoxide grim slurp swappy qt5-wayland qt6-wayland
paru -S pyprland waypaper nwg-look

# Copy Config files
cp -r ../config-files/hypr/ ~/.config/
cp -r ../config-files/wofi/ ~/.config/
cp -r ../config-files/waybar/ ~/.config/ 
cp -r ../config-files/swaylock/ ~/.config/
cp -r ../config-files/wlogout/ ~/.config/

# Enable ly as SDDM
sudo pacman -S ly
sudo cp ../config-files/ly/config.ini /etc/ly/
sudo systemctl enable ly.service -f
sudo systemctl restart ly.service
