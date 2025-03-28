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

# lazygit
alias lg="lazygit"

# Initialize startship
eval "$(starship init zsh)"

# Fastfetch
fastfetch

# Fish-like syntax highlighting and autosuggestions
source "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
