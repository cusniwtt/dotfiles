# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# checks if exa command is available before setting the aliase
if [ -x "$(command -v eza)" ]; then
  alias ls="eza -F --group-directories-first"
  alias ll="eza -l -F --group-directories-first"
  alias la="eza -la -F --group-directories-first"
  alias lt="eza -T -F --group-directories-first"
fi

# Change cat to bat
alias cat='bat --style=plain'

# Change vim to nvim
alias vi="nvim"

# Get ip
alias pubip='curl ifconfig.co/'

eval "$(starship init bash)"

# fzf
fzcd() {
    local dir
    dir=$(find * -type d 2>/dev/null | fzf +m) && cd "$dir" || return
}
alias fd=fzcd

alias sync-conf=~/.sync-conf.sh

export PATH=$PATH:/home/cusniwtt/.spicetify

