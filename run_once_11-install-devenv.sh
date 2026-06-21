#! /usr/bin/env bash

if command -v devenv >/dev/null 2>&1; then
    echo "devenv is already installed"
    exit 0
fi

echo "installing devenv ..."

if [ -z "${__ETC_PROFILE_NIX_SOURCED}" ]; then
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

nix profile add --accept-flake-config github:cachix/devenv/latest
