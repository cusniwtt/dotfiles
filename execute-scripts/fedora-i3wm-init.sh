# Update package
sudo dnf update -y
# Install dependency for i3
sudo dnf install @i3-desktop-environment polybar picom viewnior xclip lightdm slick-greeter rofi -y

cp -r ../config-files/i3/ ~/.config/
cp -r ../config-files/picom/ ~/.config/
cp -r ../config-files/rofi/ ~/.config/
cp -r ../config-files/polybar/ ~/.config/

cp -r ../config-files/rofi/fonts/ ~/.fonts/
fc-cache -f -v

echo "Press mod+shift+r to reload config"

# Change to lightdm
sudo systemctl enable lightdm.service -f
sudo cp -r ../config-files/lightdm/ /etc/
echo "Restart to lightdm"
sudo systemctl restart lightdm
