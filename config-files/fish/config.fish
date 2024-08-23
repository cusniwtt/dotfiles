source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

# Cleanup orphaned packages
alias cleanup="sudo pacman -Rsn $(pacman -Qtdq)"

# Change cat to bat
alias cat='bat --style=plain'

# Change vim to nvim
alias vi="nvim"

# Get ip
alias pubip='curl ifconfig.co/'

alias sync-conf="~/.sync-conf.sh"
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

starship init fish | source
