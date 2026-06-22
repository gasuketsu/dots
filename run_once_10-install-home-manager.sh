#! /usr/bin/env bash

if command -v home-manager >/dev/null 2>&1; then
    echo "home-manager is already installed"
    exit 0
fi

echo "installing home-manager ..."

if [ -z "${__ETC_PROFILE_NIX_SOURCED}" ]; then
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

nix run github:nix-community/home-manager -- switch --flake ~/.config/home-manager
