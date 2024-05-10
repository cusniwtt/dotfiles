# Update packages
sudo pacman -Syu

# Install dependency for i3; HINT: YOU NEED TO INSTALL i3-wm IN ARCHINSTALL PROCESS
sudo pacman -S polybar picom viewnior xclip rofi python-i3ipc -y

cp -r ../config-files/i3/ ~/.config/
cp -r ../config-files/picom/ ~/.config/
cp -r ../config-files/rofi/ ~/.config/
cp -r ../config-files/polybar/ ~/.config/
cp -r ../config-files/gtk-3.0/ ~/.config/
cp -r ../config-files/rofi/fonts/ ~/.fonts/
fc-cache -f -v
