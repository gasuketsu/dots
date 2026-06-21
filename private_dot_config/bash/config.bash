if [ -f ~/.environment ]; then
    export $(envsubst <~/.environment)
fi

export PIPENV_VENV_IN_PROJECT=1
export FZF_DEFAULT_OPTS_FILE=~/.config/fzf/config

if ! echo $PATH | grep -q "$HOME/.local/bin"; then
    export PATH=$HOME/.local/bin:$PATH
fi

eval "$(zoxide init bash)"
