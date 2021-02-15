let b:undo_ftplugin = ""

setlocal makeprg=tslint\ --format\ compact
setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
let b:undo_ftplugin .= '|setlocal makeprg<'

command! -bar -buffer Fix call system(tslint_path . ' --fix ' . expand('%')) | edit
nnoremap <buffer> <silent> <localleader>f :Fix<cr>

set wildignore+=*/node_modules/*
let b:undo_ftplugin .= '|setlocal wildignore<'

setlocal suffixesadd+=.ts,.tsx,.css
let b:undo_ftplugin .= '|setlocal suffixesadd<'

setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
let b:undo_ftplugin .= '|setlocal foldexpr<'
let b:undo_ftplugin .= '|setlocal foldmethod<'
