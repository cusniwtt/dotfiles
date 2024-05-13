# https://www.debugpoint.com/10-things-to-do-fedora-39-after-install/
echo "max_parallel_downloads=10" | sudo tee /etc/dnf/dnf.conf -a
echo "fastestmirror=True" | sudo tee /etc/dnf/dnf.conf -a

# System Update
sudo dnf update -y
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf upgrade --refresh -y
sudo dnf group update core

# Fix Firefox decoder
sudo dnf install firefox -y
sudo dnf config-manager --set-enabled fedora-cisco-openh264
sudo dnf install gstreamer1-plugin-openh264 mozilla-openh264 -y
# INSTALLING ALL CODECS FOR FEDORA
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
sudo dnf install lame\* --exclude=lame-devel -y
sudo dnf group upgrade --with-optional Multimedia --allowerasing -y

# INSTALL NVIDIA DRIVER https://rpmfusion.org/Howto/NVIDIA
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda libva libva-nvidia-driver -y

# Additional Apps
sudo dnf install git gh ranger btop fastfetch neovim flatpak fzf bat exa xinput unzip p7zip p7zip-plugins unrar curl wget kitty -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Fonts
sudo dnf install -y adobe-source-code-pro-fonts fira-code-fonts fontawesome-fonts-all google-droid-sans-fonts google-noto-sans-cjk-fonts google-noto-color-emoji-fonts google-noto-emoji-fonts jetbrains-mono-fonts
# Nerd Font
mkdir ~/.fonts
cp -r ../fonts/SauceCodePro/ ~/.fonts/
cp -r ../fonts/Noto_Sans_Thai_Looped/ ~/.fonts/
fc-cache -f -v

# Starship
curl -sS https://starship.rs/install.sh | sh
starship preset gruvbox-rainbow -o ~/.config/starship.toml

# Copy config files
cp ../dot-files/.bashrc ~/
cp -r ../config-files/kitty/ ~/.config/
cp .sync-conf.sh ~/
#cp -r ../config-files/neofetch/ ~/.config/

# NVChad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
