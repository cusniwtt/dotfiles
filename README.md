# dot-cheat-sheet
Cheat Sheet about Data Science/Data Engineer stuff with MacOS(zsh), Linux(bash), and a little bit Windows(ps)

## Windows
### neovim
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

## Linux
### First step
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
