# Neovim Config

The current machine configuration is managed from:

```sh
~/nix-darwin
```

Do not run `stow */` from this repository on the Nix-managed machine. Most
shell, Git, tmux, Alacritty, and script configuration has moved to Home Manager.

## Current Role

This repository now exists only as the live Neovim config source:

```sh
~/osx_dotfiles/nvim/.config/nvim
```

Home Manager links that directory to:

```sh
~/.config/nvim
```

Shell, Git, tmux, Alacritty, cspell, and script configuration live in
`~/nix-darwin/home/eduardoborsa.nix`.

## Active Configuration

Use the Nix configuration for changes that should be reproducible:

```sh
cd ~/nix-darwin
sudo /run/current-system/sw/bin/darwin-rebuild switch --flake .#Eduardos-MacBook-Air
```
