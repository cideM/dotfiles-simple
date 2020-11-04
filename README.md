# Intro

This is a simplified version of my [dotfiles](https://github.com/cideM/dotfiles). My other dotfiles are based on Nix and use Home Manager and NixOS to automate setup. This repository here is meant to "Just Work", whereas the Nix based configuration, while amazing if it works, has some rough edges.

## Setup

Requirements:

- GNU Stow
- [minpac](https://github.com/k-takata/minpac)
- [fisher](https://github.com/jorgebucaran/fisher)

Linux:

```shell
$ for dir in stow/{alacritty_linux, fish, git, nvim, redshift}; stow --dir stow --target $HOME -S (basename $dir); end
$ fisher
```

MacOS:

```shell
$ for dir in stow/{alacritty_darwin, fish, git, nvim}; stow --dir stow --target $HOME -S (basename $dir); end
$ fisher
```
