# Intro

This is a simplified version of my [dotfiles](https://github.com/cideM/dotfiles). My other dotfiles are based on Nix and use Home Manager and NixOS to automate setup. This repository here is meant to "Just Work", whereas the Nix based configuration, while amazing if it works, has some rough edges.

## Setup

Requirements:

- GNU Stow
- [minpac](https://github.com/k-takata/minpac)
- [fisher](https://github.com/jorgebucaran/fisher)

```shell
$ for dir in stow/*; stow --dir stow --target $HOME -S $dir; end
$ fisher
```
