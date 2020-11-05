set -x FZF_DEFAULT_COMMAND 'fd --type f 2> /dev/null'
set -x FZF_DEFAULT_TOPS '--height 40% --layout=reverse --border'
set -x FZF_CTRL_T_OPTS "--preview bat {}'"
set -x FZF_ALT_C_OPTS "--preview 'tree -a -C {} | head -200'"
set -x FZF_CTRL_T_COMMAND 'fd -L $dir --type f 2> /dev/null'

# https://github.com/fish-shell/fish-shell/issues/3412
# https://github.com/fish-shell/fish-shell/issues/5313
set -u fish_pager_color_prefix 'red' '--underline'

set -x BAT_THEME "Monokai Extended Light"

set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

set -x GO111MODULE on

set -x VISUAL nvim
set -x EDITOR nvim

# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# XDG_RUNTIME_DIR should be set by pam_systemd
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CACHE_HOME $HOME/.cache

set -x PATH                 \
    ~/.local/bin            \
    ~/bin                   \
    ~/.emacs.d/bin          \
    ~/.cargo/bin            \
    $PATH

abbr -a g 'git'
alias fzf 'fzf --color=light'
alias dash 'dash -E'

# Should be in /usr/share/fish/vendor_functions.d/ on a normal linux installation
if type -q fzf_key_bindings
    fzf_key_bindings
end

switch (uname)
	case Linux
		set -x SHELL /bin/fish
	case Darwin
		contains /usr/local/opt/coreutils/libexec/gnubin $PATH
		or set -x PATH /usr/local/opt/coreutils/libexec/gnubin $PATH

		contains /opt/local/bin $PATH
		or set -x PATH /opt/local/bin $PATH
end

eval (direnv hook fish)
