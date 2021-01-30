let b:undo_ftplugin = ""

setlocal makeprg=shellcheck
let b:undo_ftplugin .= '|setlocal makeprg<'

setlocal formatprg=shfmt
let b:undo_ftplugin .= '|setlocal formatprg<'
