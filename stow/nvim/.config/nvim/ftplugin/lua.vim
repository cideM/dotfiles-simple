let b:undo_ftplugin = ''

setlocal makeprg=luacheck\ --formatter\ plain
let b:undo_ftplugin .= '|setlocal makeprg<'

setlocal foldmethod=syntax
let b:undo_ftplugin .= '|setlocal foldmethod<'
