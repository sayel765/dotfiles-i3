# ------ TERMINAL TITLE -------
# DISABLE_AUTO_TITLE="true"
# precmd() {
#   echo -ne "\033]0;username@hostname\007"
# }

# Yazi function
function ya() {
    local tmp="$(mktemp)"
    yazi --cwd-file="$tmp"
    local last_dir="$(cat "$tmp")"
    rm "$tmp"
    if [ -d "$last_dir" ]; then
        cd "$last_dir"
    fi
}

# Zsh/Oh My Zsh setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(zsh-autosuggestions fast-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Aliases
alias cat='bat'
alias ls='lsd'
alias vi='nvim'
