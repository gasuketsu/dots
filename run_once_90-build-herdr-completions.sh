#! /usr/bin/env bash

if [ -z "${__ETC_PROFILE_NIX_SOURCED}" ]; then
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

if ! command -v herdr >/dev/null 2>&1; then
    exit 0
fi

herdr completion zsh >~/.config/zsh/completions/_herdr
