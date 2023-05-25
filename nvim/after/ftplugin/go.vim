setl formatprg=gofmt
setl makeprg=go\ build\ -o\ /dev/null
function! GoImports()
    let saved = winsaveview()
    %!goimports
    call winrestview(saved)
endfunction
nnoremap <buffer> <localleader>i :call GoImports()<cr>

