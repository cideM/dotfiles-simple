# Keep it simple

Requirements:

- GNU Stow
- [minpac](https://github.com/k-takata/minpac)
- [fisher](https://github.com/jorgebucaran/fisher)

```shell
$ for dir in stow/{alacritty, fish, git, nvim, redshift}; stow --dir stow --target $HOME -S (basename $dir); end
$ fisher
```
