#! /usr/bin/env bash

if command -v devbox >/dev/null 2>&1; then
    echo "devbox is already installed"
    exit 0
fi

echo "installing devbox ..."

if [ -z "${__ETC_PROFILE_NIX_SOURCED}" ]; then
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

nix profile add github:jetify-com/devbox/latest
