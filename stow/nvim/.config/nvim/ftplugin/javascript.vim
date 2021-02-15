let b:undo_ftplugin = ""

setlocal formatprg=prettier\ --stdin-filepath
let b:undo_ftplugin .= '|setlocal formatprg<'

setlocal makeprg=eslint\ --format\ compact
setlocal errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#
let b:undo_ftplugin .= '|setlocal makeprg<'

" TODO: Convert to working on range
command! -bar -buffer Fix call system('eslint --fix ' . expand('%')) | edit
nnoremap <buffer> <silent> <localleader>f :Fix<cr>

let g:jsx_ext_required        = 0
let b:undo_ftplugin .= '|unlet g:jsx_ext_required'

let g:javascript_plugin_jsdoc = 1
let b:undo_ftplugin .= '|unlet g:javascript_plugin_jsdoc'

let g:javascript_plugin_flow  = 1
let b:undo_ftplugin .= '|unlet g:javascript_plugin_flow'

setlocal wildignore+=*/node_modules/*
let b:undo_ftplugin .= '|setlocal wildignore<'

setlocal suffixesadd+=.js,.jsx,.css
let b:undo_ftplugin .= '|setlocal suffixesadd<'

nnoremap <buffer> <silent> <localleader>m :make %<cr>

command! -bar -buffer JestSplit :split | execute 'terminal jest '. expand('%')
nnoremap <buffer> <silent> <localleader>ts :JestSplit<cr>

command! -bar -buffer JestSplitWatch :split | execute 'terminal jest --watch '. expand('%')
nnoremap <buffer> <silent> <localleader>tw :JestSplitWatch<cr>

setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()
let b:undo_ftplugin .= '|setlocal foldexpr<'
let b:undo_ftplugin .= '|setlocal foldmethod<'
