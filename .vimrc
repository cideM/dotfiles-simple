unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

packadd! matchit

set hlsearch
set visualbell
set textwidth=72
set formatoptions+=r
set hidden
set noerrorbells
set noexpandtab
set nostartofline
set autoindent
set backspace=2
set laststatus=2
set list
set listchars=eol:¬,space:\ ,lead:\ ,trail:·,nbsp:◇,tab:→\ ,extends:❯,precedes:❮,multispace:\·\ \ \,leadmultispace:\│\ \ \ ,
set grepprg=rg\ -H\ --vimgrep

let mapleader = " "
nnoremap <Leader>/ :nohlsearch<CR>
nnoremap <BS> <C-^>
