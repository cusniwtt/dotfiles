source /usr/share/cachyos-fish-config/cachyos-config.fish
# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

#
alias cat='bat --style=plain'

# Change vim to nvim
alias vi="nvim"

# Get ip
alias pubip='curl ifconfig.co/'

eval "$(starship init fish)"

alias sync-conf=~/.sync-conf.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/cusniwtt/miniconda3/bin/conda
    eval /home/cusniwtt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/cusniwtt/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/cusniwtt/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/cusniwtt/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

