# dot-cheat-sheet
Cheat Sheet about Data Science/Data Engineer stuff with MacOS(zsh), Linux(bash), and a little bit Windows(ps)

## Windows (Powershell)
### (Must have) Git
```powershell
winget install -e --id Git.Git
```
### NeoVim [for additional](https://github.com/neovim/neovim/wiki/Installing-Neovim)
```
winget install Neovim.Neovim
```
need to check where powershell profile path is in
```
$profile
```
If file not here or dont have path. create it first!
```
echo $null >> /path of $profile/
notepad $profile
```
paste it in $profile file
```
$nvimPath = "C:\Path\to\Neovim"  # Replace with the actual path to your Neovim installation
$env:Path += ";$nvimPath"
function n {
    & "$nvimPath\nvim.exe" $args
}
```
save and restart terminal (or powershell)
### (Optional but Recommend) NVChad
You need to install NeoVim first
```
git clone https://github.com/NvChad/NvChad $HOME\AppData\Local\nvim --depth 1 && nvim
```

---
## Linux (Bash or Zsh)
### (Must do!) First step
```
sudo apt update && sudo apt upgrade -y
```
### Install Neofetch
```
sudo apt install neofetch -y
```
### Install gcc
```
sudo apt install build-essential -y
```
### (Optional) NVIDIA GPU [for additional information](https://ubuntu.com/tutorials/enabling-gpu-acceleration-on-ubuntu-on-wsl2-with-the-nvidia-cuda-platform#1-overview)
```
sudo apt install ubuntu-drivers-common
sudo ubuntu-drivers autoinstall
nvidia-smi
```
### NeoVim [for additioanl](https://github.com/neovim/neovim/wiki/Installing-Neovim)
```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim -y
```
### (Optional but Recommend) NVChad
You need to install NeoVim first
```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

---
## MacOS (Zsh)
### (Must have!) Brew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Dont forget to inspect installation process. It need to do after install complete. The Installation instsruction will lead you how to do.
### NeoVim [for additioanal](https://github.com/neovim/neovim/wiki/Installing-Neovim)
```
brew install neovim
```
### (Optional but Recommend) NVChad
You need to install NeoVim first
```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```
