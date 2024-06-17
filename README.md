# dot-cheat-sheet
Cheat Sheet about Data Science/Data Engineer stuff with MacOS(zsh), Linux(bash), and a little bit Windows(ps)

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->
## Table of Contents
- [Cool apps and dot-file config](#dot-cheat-sheet)
  * [Windows (Powershell)](#windows-powershell)
  * [Linux (Bash or Zsh)](#linux-bash-or-zsh)
  * [MacOS (Zsh)](#macos-zsh)
- [PostgreSQL](./markdown/postgres.md)
  * [Login (Require)](./markdown/postgres.md/#login-require)
  * [Postgres Command](./markdown/postgres.md/#postgres-command)
  * [User / Role](./markdown/postgres.md/#user--role)

<!-- TOC end -->

## Windows (Powershell)
>Note: Windows part may need to update. I use this OS for Game PC Only LoL ;P
### (Must have) Git
```powershell
winget install -e --id Git.Git
```
### NeoVim [for additional](https://github.com/neovim/neovim/wiki/Installing-Neovim)
```powershell
winget install Neovim.Neovim
```
need to check where powershell profile path is in
```powershell
$profile
```
If file not here or dont have path. create it first!
```powershell
echo $null >> /path of $profile/
notepad $profile
```
paste it in $profile file
```powershell
$nvimPath = "C:\Path\to\Neovim"  # Replace with the actual path to your Neovim installation
$env:Path += ";$nvimPath"
function n {
    & "$nvimPath\nvim.exe" $args
}
```
save and restart terminal (or powershell)
### (Optional but Recommend) NVChad
You need to install NeoVim first [for additional](https://nvchad.com/docs/quickstart/install)
```powershell
git clone https://github.com/NvChad/NvChad $HOME\AppData\Local\nvim --depth 1
nvim
```

---
## Ubuntu (Debian base distro)
>Note: This part will aim to setup Linux with **Debian** base eg. Debian, Ubuntu etc. So, Instructon will cover only `apt` only.
### (Must do!) First step
```bash
sudo apt update && sudo apt upgrade -y
```
### Install Neofetch
```bash
sudo apt install neofetch -y
```
### Install gcc
```bash
sudo apt install build-essential -y
```
### (Optional) NVIDIA GPU [for additional information](https://ubuntu.com/tutorials/enabling-gpu-acceleration-on-ubuntu-on-wsl2-with-the-nvidia-cuda-platform#1-overview)
```bash
sudo apt install ubuntu-drivers-common
sudo ubuntu-drivers autoinstall
nvidia-smi
```
### NeoVim [for additioanl](https://github.com/neovim/neovim/wiki/Installing-Neovim)
```bash
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim -y
```
### (Optional but Recommend) NVChad
You need to install NeoVim first [for additional](https://nvchad.com/docs/quickstart/install)
```bash
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

---

## Arch (Arch base distro)
Just simple run init scripts!
```
chmod +x ./execute-scripts/arch-init.sh && ./execute-scripts/arch-init.sh
```
For install Hyprland
```
chmod +x ./execute-scripts/arch-hyprland.sh && ./execute-scripts/arch-hyprland.sh
```

---

## Fedora (RHEL base distro)
Just simple run ini scripts!
```
chmod +x ./execute-scripts/fedora-init.sh && ./execute-scripts/fedora-init.sh
```
For install Hyprland
```
chmod +x ./execute-scripts/fedora-hyprland.sh && ./execute-scripts/fedora-hyprland.sh
```
---

## MacOS (Zsh)
### (Must have!) [Brew](https://brew.sh)
```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Dont forget to inspect installation process. It need to do after install complete. The Installation instsruction will lead you how to do.
### NeoVim [for additioanal](https://github.com/neovim/neovim/wiki/Installing-Neovim)
```zsh
brew install neovim
```
### (Optional but Recommend) NVChad
You need to install NeoVim first [for additional](https://nvchad.com/docs/quickstart/install)
```zsh
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```
