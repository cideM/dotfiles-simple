#!/bin/sh

# https://discourse.nixos.org/t/migrating-from-homebrew-to-nix-for-osx/2892

package_dir=packages_per_host

brew leaves > "$package_dir"/"$(hostname)".txt
brew list --cask > "$package_dir"/"$(hostname)"_cask.txt
