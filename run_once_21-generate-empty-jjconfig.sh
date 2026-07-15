#! /usr/bin/env bash

JJCONFIG_FILE="$HOME/.config/jj/config.toml"
if [ -f "$JJCONFIG_FILE" ]; then
    exit 0
fi

mkdir -p "$HOME/.config/jj"
echo -e "#:schema https://docs.jj-vcs.dev/latest/config-schema.json\n\n" >>"$JJCONFIG_FILE"
