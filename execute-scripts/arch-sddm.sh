sudo cp ../config-files/sddm/sddm.conf /etc/
sudo cp ../config-files/sddm/theme.conf /usr/share/sddm/themes/maldives/
sudo cp ../config-files/wallpapers/arch.jpg /usr/share/sddm/themes/maldives/background.jpg

sudo systemctl restart sddm
