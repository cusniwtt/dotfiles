# This scrit is not installation script, Before run this script
# You need to install Hyprland From https://github.com/JaKooLit/Arch-Hyprland
# This script is only dotfiles and configs config-files

sudo pacman -S waybar hyprpaper cliphist swaylock wlogout wofi yazi ffmpegthumbnailer unarchiver jq poppler fd ripgrep fzf zoxide
paru -S pyprland hyprshot

# Copy Config files
cp -r ../config-files/hypr/ ~/.config/
cp -r ../config-files/wofi/ ~/.config/
cp -r ../config-files/waybar/ ~/.config/ 
cp -r ../config-files/wlogout/ ~/.config/
cp -r ../config-files/swaylock/ ~/.config/
