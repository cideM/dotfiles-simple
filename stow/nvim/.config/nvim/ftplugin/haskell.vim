let b:undo_ftplugin="setlocal formatprg< foldmethod<"

set formatprg=ormolu

nnoremap <buffer> <localleader>t :silent !fast-tags -R .<cr>
