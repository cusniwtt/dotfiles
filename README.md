# Dotfiles and Development Environment Setup

This repository contains my personal dotfiles and scripts for setting up a development environment on Linux and macOS.

## Installation

To use these dotfiles and scripts, simply clone this repository to your home directory:
```bash
git clone https://github.com/cusniwtt/dotfiles.git ~/
```

## Dotfiles
This repository includes the following dotfiles:

- `common-stow/.bashrc`: Bash shell configuration
- `common-stow/.zshrc`: Zsh shell configuration
- `common-stow/.profile`: Profile configuration

## Scripts
This repository includes the following scripts:

- `scripts/manage_conda_env.sh`: Manage Conda environments
- `scripts/fedora-init.sh`: Initialize Fedora Linux environment
- `scripts/arch-init.sh`: Initialize Arch Linux environment
- `scripts/git-config-global.sh`: Configure Git globally

### GNOME Extension List (GNOME49)
- App menu is back
- Status Area Horizontal Spacing
- Clipboard Indicator

## License

These dotfiles and scripts are released under the [GNU General Public License v3.0](./LICENSE)
Note that you'll need to install `stow` on your system before you can use it to manage your dotfiles. On most Linux systems, you can install `stow` with your package manager.
