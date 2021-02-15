let b:undo_ftplugin = ""

setlocal formatprg=prettier\ --parser\ markdown\ --stdin-filepath

let b:undo_ftplugin .= '|unlet formatprg<'
