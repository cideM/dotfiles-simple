source /opt/local/share/fzf/shell/key-bindings.fish

fish_add_path /opt/local/libexec/gnubin/

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CACHE_HOME $HOME/.cache

bind \cb edit_command_buffer

set -x LANG en_US.UTF-8
# TODO: What is this?
set -x LC_ALL en_US.UTF-8
# TODO: What is this?
set -x LC_CTYPE en_US.UTF-8

set -x EDITOR vim
set -x VISUAL vim

set -x FZF_DEFAULT_COMMAND 'fd --type f 2> /dev/null'
set -x FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border --no-color'
set -x FZF_CTRL_T_OPTS "--preview 'cat {}'"
set -x FZF_CTRL_T_COMMAND 'fd -L $dir --type f 2> /dev/null'

set -x GOPATH ~/go
