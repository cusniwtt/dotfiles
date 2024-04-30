# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/cusniwtt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/cusniwtt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/cusniwtt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/cusniwtt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# checks if exa command is available before setting the aliase
if [ -x "$(command -v exa)" ]; then
  alias ls="exa --classify --group-directories-first"
  alias ll="exa --long --header --classify --group-directories-first --no-permissions"
  alias la="exa -a --long --header --classify --group-directories-first"
  alias lt="exa --tree --long --header --classify --group-directories-first"
fi

# Change cat to bat
alias cat='bat --style=plain'

# Change vim to nvim
alias vi="sudo nvim"

# Get ip
alias pubip='curl ifconfig.co/'

# Add shotcut cli
alias atop="sudo asitop --color 7 --show_cores True"

# fzf
fzcd() {
    local dir
    dir=$(find * -type d 2>/dev/null | fzf +m) && cd "$dir" || return
}
alias fd=fzcd

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"
