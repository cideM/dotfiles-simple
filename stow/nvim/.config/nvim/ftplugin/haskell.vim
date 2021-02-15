let b:undo_ftplugin="setlocal formatprg< foldmethod<"

set formatprg=ormolu

nnoremap <buffer> <localleader>t :silent !fast-tags -R .<cr>

setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
let b:undo_ftplugin .= '|setlocal foldexpr<'
let b:undo_ftplugin .= '|setlocal foldmethod<'
