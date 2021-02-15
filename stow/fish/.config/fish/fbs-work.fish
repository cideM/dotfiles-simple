contains (brew --prefix)/opt/coreutils/libexec/gnubin $PATH
or set -x PATH (brew --prefix)/opt/coreutils/libexec/gnubin $PATH

contains /opt/local/bin $PATH
or set -x PATH /opt/local/bin $PATH

set -x FISH_NOTES_DIR ~/.local/share/fish_notes
set -x FISH_WORK_NOTES ~/.local/share/work_notes
