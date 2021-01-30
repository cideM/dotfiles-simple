let b:undo_ftplugin = ""
setlocal formatprg=prettier\ --stdin-filepath
let b:undo_ftplugin .= '|setlocal formatprg<'
