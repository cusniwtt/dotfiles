sudo pacman -S qt5-graphicaleffects sddm

# maldives
sudo cp ../config-files/sddm/maldives/theme.conf /usr/share/sddm/themes/maldives/
sudo cp ../config-files/wallpapers/arch.jpg /usr/share/sddm/themes/maldives/background.jpg

# Slice
sudo cp -r ../config-files/sddm/sddm-slice/ /usr/share/sddm/themes/

# config-files
sudo cp ../config-files/sddm/sddm.conf /etc/

sudo systemctl enable sddm.service -f
sudo systemctl restart sddm.service
