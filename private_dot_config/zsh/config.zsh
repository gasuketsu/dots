if [ -f ~/.environment ]; then
    export $(envsubst <~/.environment)
fi
export KEYTIMEOUT=120
export PIPENV_VENV_IN_PROJECT=1
export FZF_DEFAULT_OPTS_FILE=~/.config/fzf/config
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#54546d"

if ! echo $PATH | grep -q "$HOME/.local/bin"; then
    export PATH=$HOME/.local/bin:$PATH
fi

eval "$(devbox global shellenv)"
eval "$(sheldon source)"
eval "$(zoxide init zsh)"

if type fzf >/dev/null 2>&1; then
    source <(fzf --zsh)

    if [ -f "$DEVBOX_PACKAGES_DIR/share/fzf-git-sh/fzf-git.sh" ]; then
        source $DEVBOX_PACKAGES_DIR/share/fzf-git-sh/fzf-git.sh
    fi
fi

# aliases
source ~/.config/zsh/aliases.zsh

# completions
fpath=($HOME/.config/zsh/completions "${fpath[@]}")
autoload -Uz compinit && compinit

eval "$(starship init zsh)"
