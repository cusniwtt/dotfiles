sudo dnf update -y

sudo dnf install polybar picom viewnior xclip -y

cp -r ../config-files/i3/ ~/.config/
cp -r ../config-files/picom/ ~/.config/
cp -r ../config-files/rofi/ ~/.config/
cp -r ../config-files/polybar/ ~/.config/

cp -r ../config-files/rofi/fonts/ ~/.fonts/
fc-cache -f -v

echo "Press mod+shift+r to reload config"
