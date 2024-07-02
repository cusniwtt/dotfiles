# Update All packages
sudo pacman -Syu

# Install nessesary packages
sudo pacman -S libva-nvidia-driver zsh zsh-syntax-highlighting zsh-autosuggestions zsh-history-substring-search bash-completion git
sudo pacman -S fastfetch fzf btop rsync github-cli neovim bat exa unzip p7zip unrar curl wget kitty capitaine-cursors pavucontrol -y
chsh -s /usr/bin/zsh
# Remove not used

# Add git config
./git-config-global.sh

# Nerd Font with pac group + thai font
sudo pacman -S $(pacman -Sgq nerd-fonts)
cp -r ../fonts/Noto_Sans_Thai_Looped/ ~/.fonts/
fc-cache -f -v

# Starship
curl -sS https://starship.rs/install.sh | sh
#starship preset gruvbox-rainbow -o ~/.config/starship.toml
starship preset jetpack -o ~/.config/starship.toml

# Copy config files
cp ../dot-files/.bashrc ~/
cp ../dot-files/.zshrc ~/
cp ../dot-files/.profile ~/
cp ../config-files/gtk-3.0/ ~/.config/
cp ../config-files/gtk-4.0/ ~/.config/
cp -r ../config-files/kitty/ ~/.config/
cp -r ../config-files/fish/ ~/.config/
cp -r ../config-files/wallpapers/ ~/.config/
cp -r ../config-files/fastfetch/ ~/.config/
ln -s ~/.config/wallpapers/ ~/Wallpapers
cp .sync-conf.sh ~/

# Insall paru
sudo pacman -S --needed base-devel -y
git clone https://aur.archlinux.org/paru.git ~/Documents/paru
cd ~/Documents/paru
makepkg -si

# NVChad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
