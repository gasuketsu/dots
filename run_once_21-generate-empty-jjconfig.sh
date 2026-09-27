#! /usr/bin/env bash

JJCONFIG_FILE="$HOME/.config/jj/config.toml"
if [ -f "$JJCONFIG_FILE" ]; then
    exit 0
fi

mkdir -p "$HOME/.config/jj"
touch "$JJCONFIG_FILE"
