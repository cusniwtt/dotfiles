# https://www.debugpoint.com/10-things-to-do-fedora-39-after-install/
sudo echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
sudo echo "fastestmirror=True" >> /etc/dnf/dnf.conf

# System Update
sudo dnf update -y
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf upgrade --refresh -y
sudo dnf group update core

# Additional Apps
sudo dnf install gnome-tweak-tool -y
flatpak remote-modify --enable flathub

flatpak install flathub com.google.Chrome -y
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.valvesoftware.Steam -y
flatpak install flathub com.mattjakeman.ExtensionManager -y

sudo dnf install git gh htop btop neofetch neovim fzf bat exa unzip p7zip p7zip-plugins unrar curl wget kitty -y

# Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/SourceCodePro.zip
mkdir SourceCodePro
unzip ./SourceCodePro.zip -d SourceCodePro/
mkdir ~/.fonts
mv SourceCodePro/ ~/.fonts/
rm SourceCodePro.zip
fc-cache -f -v

# Starship
curl -sS https://starship.rs/install.sh | sh

# Copy config files
cp ../dot-files/.bashrc ~/
cp -r ../config-files/kitty/ ~/.config/

# NVChad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
