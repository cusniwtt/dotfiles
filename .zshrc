[[ -f ~/.config/zsh/starship.zsh ]] && source ~/.config/zsh/starship.zsh

# Load Starship

eval "$(starship init zsh)"


# checks if exa command is available before setting the aliase
if [ -x "$(command -v exa)" ]; then
  alias ls="exa --icons --classify --group-directories-first"
  alias ll="exa --long --header --classify --icons --group-directories-first --no-permissions"
  alias la="exa -a --long --header --classify --icons --group-directories-first"
  alias lt="exa --tree --long --header --classify --icons --group-directories-first"
fi

alias cat='bat --style=plain'

# Change vim to nvim
alias vi=nvim

# Add shotcut cli
alias atop="sudo asitop --color 7"

# Add shotcut to multipass (Ubuntu)
alias mp="multipass"

# Fasttyper for WPM
alias typetest='fasttyper -n'

# TUIME activation
export "PATH=/Users/cusniwtt/.cargo/bin:$PATH"
alias clock='tuime --screensaver --format "%H:%M:%S" -f font3d -c yellow -c red'

# Mac-cleanup
alias cleanup="mac-cleanup -n"

# Get ip
alias pubip='curl ifconfig.co/'

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# ngrok init
alias ngrok="~/opt/ngrok/ngrok"

# fzf
fzcd() {
    local dir
    dir=$(find * -type d 2>/dev/null | fzf +m) && cd "$dir" || return
}
alias fd=fzcd
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/cusniwtt/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/cusniwtt/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/cusniwtt/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/cusniwtt/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

