let b:undo_ftplugin = ""

set suffixesadd+=.js,.jsx,.css

let &formatprg='prettier --stdin-filepath ' . expand('%')
let b:undo_ftplugin .= '|setlocal formatprg<'
