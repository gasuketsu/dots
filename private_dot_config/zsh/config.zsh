if [ -f ~/.environment ]; then
    export $(envsubst <~/.environment)
fi
if [ -f ~/.environment.local ]; then
    export $(envsubst <~/.environment.local)
fi
export KEYTIMEOUT=120
export PIPENV_VENV_IN_PROJECT=1
export FZF_DEFAULT_OPTS_FILE=~/.config/fzf/config
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#54546d"

if ! echo $PATH | grep -q "$HOME/.local/bin"; then
    export PATH=$HOME/.local/bin:$PATH
fi

eval "$(sheldon source)"
eval "$(zoxide init zsh)"

source <(fzf --zsh)

# aliases
source ~/.config/zsh/aliases.zsh

# completions
fpath=($HOME/.config/zsh/completions "${fpath[@]}")
autoload -Uz compinit && compinit

eval "$(starship init zsh)"
