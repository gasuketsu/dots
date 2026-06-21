# dots

Manages dotfiles and tools with chezmoi + home-manager + devenv

## Prerequisites

Install several 'must-have' packages into your host as below.

### Debian/Ubuntu

```sh
sudo apt install git zsh build-essential wl-clipboard curl zip unzip ncurses-term gettext-base
```

### openSUSE

```sh
sudo zypper install -t pattern devel_basis devel_C_C++
sudo zypper install git zsh dirmngr wl-clipboard curl zip unzip terminfo
```

### archlinux

```sh
sudo pacman -S base-devel git zsh zlib-ng wl-clipboard curl zip unzip
```

Also, [chezmoi](https://www.chezmoi.io/) must be installed into your host.

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin
```

## Steps to deploy

```sh
chezmoi init gasuketsu/dots
chezmoi apply
```

> [!NOTE]
> Depending on your distro/environment, you may need to add `$HOME/.local/bin` to your PATH to run chezmoi.

> [!NOTE]
> Following will be installed during initial `chezmoi apply` if they are not available.
>
> - [Determinate Nix](https://determinate.systems/nix/)
> - [home-manager](https://github.com/nix-community/home-manager)
> - [devenv](https://github.com/cachix/devenv)
