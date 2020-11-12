set -x FZF_DEFAULT_COMMAND 'fd --type f 2> /dev/null'
set -x FZF_DEFAULT_TOPS '--height 40% --layout=reverse --border'
set -x FZF_CTRL_T_OPTS "--preview bat {}'"
set -x FZF_ALT_C_OPTS "--preview 'tree -a -C {} | head -200'"
set -x FZF_CTRL_T_COMMAND 'fd -L $dir --type f 2> /dev/null'

# Should be in /usr/share/fish/vendor_functions.d/ on a normal linux installation
if type -q fzf_key_bindings
    fzf_key_bindings
end

alias fzf 'fzf --color=light'

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

for p in ~/.local/bin ~/bin ~/.emacs.d/bin ~/.cargo/bin
    if not contains $p $PATH
        set -a PATH $p
    end
end

abbr -a kubedebug 'kubectl run -i --tty --rm debug --image=radial/busyboxplus:curl --restart=Never -- sh'
abbr -a g 'git'
abbr -a dc 'docker-compose'
abbr -a tf 'terraform'
alias dash 'dash -E'

if test -f "$HOME/.config/fish/(hostname -s).fish"
    source "$HOME/.config/fish/(hostname -s).fish"
end
