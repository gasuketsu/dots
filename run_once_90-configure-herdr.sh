#! /usr/bin/env bash

if [ -z "${__ETC_PROFILE_NIX_SOURCED}" ]; then
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

herdr completion zsh >~/.config/zsh/completions/_herdr
herdr integration install opencode
