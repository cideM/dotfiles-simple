#!/bin/sh

package_dir=packages_per_host

yay -Qqettm > "$package_dir"/"$(hostname)"_aur.txt
yay -Qqettn > "$package_dir"/"$(hostname)"_arch.txt
