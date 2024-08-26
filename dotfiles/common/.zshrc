# Cleanup orphaned packages
alias cleanup="sudo pacman -Rsn $(pacman -Qtdq)"

# Enable Wayland support for different applications
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export WAYLAND=1
    export QT_QPA_PLATFORM='wayland;xcb'
    export GDK_BACKEND='wayland,x11'
    export MOZ_DBUS_REMOTE=1
    export MOZ_ENABLE_WAYLAND=1
    export _JAVA_AWT_WM_NONREPARENTING=1
    export BEMENU_BACKEND=wayland
    export CLUTTER_BACKEND=wayland
    export ECORE_EVAS_ENGINE=wayland_egl
    export ELM_ENGINE=wayland_egl
fi

# checks if exa command is available before setting the aliase
if [ -x "$(command -v eza)" ]; then
  alias ls="eza -F --group-directories-first"
  alias ll="eza -l -F --group-directories-first"
  alias la="eza -la -F --group-directories-first"
  alias lt="eza -T -F --group-directories-first"
fi

# Change cat to bat
alias cat="bat --style=plain"

# Change vim to nvim
alias vi="nvim"

# Get ip
alias pubip="curl ifconfig.co/"

# Sync config
alias sconf="~/.sync-conf.sh"

# lazygit
alias lg="lazygit"

# fzf
fzcd() {
    local dir
    dir=$(find * -type d 2>/dev/null | fzf +m) && cd "$dir" || return
}
alias fd=fzcd

# Initialize startship
eval "$(starship init zsh)"

# Fish-like syntax highlighting and autosuggestions
source "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
# Use history substring search
source "/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/cusniwtt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
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

