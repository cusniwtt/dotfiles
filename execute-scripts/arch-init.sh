# Update All packages
sudo pacman -Syu

# Install nessesary packages
sudo pacman -S fastfetch fzf btop rsync flatpak git ranger neovim bat exa xinput unzip p7zip unrar curl wget kitty -y

# Nerd Font
mkdir ~/.fonts
cp -r ../fonts/SourceCodePro/ ~/.fonts/
cp -r ../fonts/Noto_Sans_Thai_Looped/ ~/.fonts/
fc-cache -f -v

# Starship
curl -sS https://starship.rs/install.sh | sh
starship preset gruvbox-rainbow -o ~/.config/starship.toml

# Copy config files
cp ../dot-files/.bashrc ~/
cp -r ../config-files/kitty/ ~/.config/
cp -r ../config-files/wallpapers/ ~/.config/
cp .sync-conf.sh ~/
#cp -r ../config-files/neofetch/ ~/.config/

# NVChad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
