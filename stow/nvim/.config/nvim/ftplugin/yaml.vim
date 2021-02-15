let b:undo_ftplugin = ""
setlocal formatprg=prettier\ --stdin-filepath
let b:undo_ftplugin .= '|setlocal formatprg<'

setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
let b:undo_ftplugin .= '|setlocal foldexpr<'
let b:undo_ftplugin .= '|setlocal foldmethod<'
