let b:undo_ftplugin = ""

compiler go

setlocal formatprg=gofmt
let b:undo_ftplugin .= '|setlocal formatprg<'

" https://github.com/leeren/dotfiles/blob/master/vim/.vim/ftplugin/go.vim
command! -buffer -range=% Gofmt let b:winview = winsaveview() |
  \ silent! execute <line1> . "," . <line2> . "!gofmt " | 
  \ call winrestview(b:winview)

command! -buffer -range=% Goimport let b:winview = winsaveview() |
  \ silent! execute <line1> . "," . <line2> . "!goimports " | 
  \ call winrestview(b:winview)

nnoremap <silent> <localleader>m :execute 'make ' . expand('%:p:h')<CR>
nnoremap <silent> <localleader>i :Goimport<CR>
