# Update All packages
sudo pacman -Syu

# Install nessesary packages
sudo pacman -S fastfetch fzf btop rsync github-cli bash-completion flatpak git neovim bat exa unzip p7zip unrar curl wget kitty -y
# Remove not used

# Nerd Font
mkdir ~/.fonts
cp -r ../fonts/SauceCodePro/ ~/.fonts/
cp -r ../fonts/Noto_Sans_Thai_Looped/ ~/.fonts/
fc-cache -f -v

# Starship
curl -sS https://starship.rs/install.sh | sh
starship preset gruvbox-rainbow -o ~/.config/starship.toml

# Install fastfetch theme (Arch)
mkdir ~/.local/share/fastfetch
git clone https://github.com/LierB/fastfetch ~/.local/share/fastfetch

# Copy config files
cp ../dot-files/.bashrc ~/
cp -r ../config-files/kitty/ ~/.config/
cp -r ../config-files/wallpapers/ ~/.config/
cp -r ../config-files/fastfetch/ ~/.config/
ln -s ~/.config/wallpapers/ ~/Wallpapers/
cp .sync-conf.sh ~/

# Insall yay
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay
makepkg -si
cd ~/

# NVChad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
