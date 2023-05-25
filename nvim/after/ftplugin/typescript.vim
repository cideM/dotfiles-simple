setl formatprg=prettier\ --parser\ typescript\ --stdin-filepath\ %
setl wildignore+=*node_modules*,package-lock.json,yarn-lock.json
setl errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m,%-G%.%#

