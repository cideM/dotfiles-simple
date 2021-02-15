set -x FZF_DEFAULT_COMMAND 'fd --type f 2> /dev/null'
set -x FZF_DEFAULT_TOPS '--height 40% --layout=reverse --border'
set -x FZF_CTRL_T_OPTS "--preview bat {}'"
set -x FZF_ALT_C_OPTS "--preview 'tree -a -C {} | head -200'"
set -x FZF_CTRL_T_COMMAND 'fd -L $dir --type f 2> /dev/null'

set -x FISH_NOTES_EXTENSION .md

# COLORS
# https://github.com/fish-shell/fish-shell/issues/4695
# https://fishshell.com/docs/2.0/index.html
# $ set | rg color
# $ set_color -c
# $ nix-shell -p gettext
# $ msgcat --color=test

# Background of tab completion and matched part in history
set fish_color_search_match --background=yellow

set fish_pager_color_prefix normal --bold
set fish_pager_color_description normal
set fish_pager_color_progress normal

# https://github.com/fish-shell/fish-shell/issues/5527
set fish_color_match normal --underline

set fish_color_comment --italics
set fish_color_command magenta
set fish_color_quote green
set fish_color_error red --bold

if type -q fzf_key_bindings
    fzf_key_bindings
end

alias fzf 'fzf --color=light'

set -x BAT_THEME "OneHalfLight"

set -x LANG en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

set -x GO111MODULE on

set -x VISUAL nvim
set -x EDITOR nvim
set -x GOPATH ~/go

# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
# XDG_RUNTIME_DIR should be set by pam_systemd
set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CACHE_HOME $HOME/.cache

for p in ~/.local/bin ~/bin ~/.emacs.d/bin ~/.cargo/bin ~/go/bin ~/.go/bin
    if not contains $p $PATH
        set -a PATH $p
    end
end

abbr -a kubedebug 'kubectl run -i --tty --rm debug --image=radial/busyboxplus:curl --restart=Never -- sh'
abbr -a g 'git'
abbr -a dc 'docker-compose'
abbr -a tf 'terraform'
abbr -a wn 'FISH_NOTES_DIR=$FISH_WORK_NOTES n'
abbr -a work-agenda 'FISH_NOTES_DIR=$FISH_WORK_NOTES agenda'
abbr -a work-new-agenda 'FISH_NOTES_DIR=$FISH_WORK_NOTES new-agenda'
abbr -a work-notes 'FISH_NOTES_DIR=$FISH_WORK_NOTES notes'
abbr -a work-todos 'FISH_NOTES_DIR=$FISH_WORK_NOTES todos'

alias dash 'dash -E'
alias niv 'niv --no-colors'

if test -f $HOME/.config/fish/(hostname -s).fish
    source $HOME/.config/fish/(hostname -s).fish
end
