packadd parinfer-rust

let current_compiler="clj-kondo"

setlocal errorformat=%f:%l:%c:\ Parse\ %t%*[^:]:\ %m,%f:%l:%c:\ %t%*[^:]:\ %m
setlocal makeprg=clj-kondo\ --lint\ %
