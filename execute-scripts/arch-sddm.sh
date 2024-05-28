sudo cp -r ../config-files/sddm/archlinux-simplyblack/ /usr/share/sddm/themes/
sudo cp -r ../config-files/sddm/sddm.conf /etc/

sudo systemctl restart sddm.service
