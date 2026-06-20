#! /usr/bin/env bash

# make sure nix-related envvar is applied.
. /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

nix run github:nix-community/home-manager -- switch --flake ~/.config/home-manager
home-manager switch
