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


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/cusniwtt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/cusniwtt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/cusniwtt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/cusniwtt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

