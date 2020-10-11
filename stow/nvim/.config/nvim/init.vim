""""""""""""""""""""""""""""""
"       GENERAL SETTINGS     "
""""""""""""""""""""""""""""""
set background=light
set wildignore+=*/.git/*,
            \*/node_modules/*,
            \*/build/*,
            \*/dist/*,
            \*/compiled/*,
            \*/tmp/*
set hidden
set ignorecase
set smartcase
set splitbelow
set splitright
set termguicolors
set undofile
" Use ripgrep
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
colorscheme seoul256-light

" Call my own SetPath function so that every git file is added to path. Let's
" me get most of FZF without using FZF
augroup SetPath
    autocmd!
    autocmd BufEnter,DirChanged * call pathutils#SetPath()
augroup END

" Built-in Neovim feature that highlights yanked code.
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Format the buffer with the current formatprg. Most of the custom code here
" is just so my jump list isn't cluttered and I always end up at the first
" line when undoing a FormatBuffer call. See the linked post.
function! FormatBuffer()
  let view = winsaveview()
  " https://vim.fandom.com/wiki/Restore_the_cursor_position_after_undoing_text_change_made_by_a_script
  normal ix
  normal x
  try | silent undojoin | catch | endtry
  keepjumps normal ggVGgq
  call winrestview(view)
endfunction

""""""""""""""""""""""""""""""
"          MAPPINGS          "
""""""""""""""""""""""""""""""
let mapleader = " "
let maplocalleader = ","

" Leave insert mode with jk
imap jk <Esc>

" Convenience mappings for calling :grep
nnoremap <leader>gg :grep<space>
nnoremap <leader>gw :grep -wF ""<left>

" Just calls formatprg on entire buffer
nmap <leader>Q :call FormatBuffer()<cr>

nnoremap <leader>f :find *
nnoremap <leader>b :ls<cr>:buffer<Space>

" Switch to alternate buffer with backspace
nnoremap <BS> <C-^>

" Reflow comments according to max line length. This temporarily unsets
" formatprg so cindent (?) is used. I don't know... this mostly just works.
nnoremap <leader>R :set operatorfunc=reflow#Comment<cr>g@
vnoremap <leader>R :<C-u>call reflow#Comment(visualmode())<cr>

""""""""""""""""""""""""""""""
"          PLUGINS           "
""""""""""""""""""""""""""""""
let g:EditorConfig_max_line_indicator = "exceeding"
let g:EditorConfig_preserve_formatoptions = 1


" Sad makes replacing selections easier and just automates some tedious
" plumbing around slash search and cgn
nmap <leader>c <Plug>(sad-change-forward)
nmap <leader>C <Plug>(sad-change-backward)
xmap <leader>c <Plug>(sad-change-forward)
xmap <leader>C <Plug>(sad-change-backward)

" Otherwise the status line is overwritten with matching code parts
let g:matchup_matchparen_offscreen = {}

" No ctags for Haskell
let g:gutentags_exclude_filetypes = ['haskell']
let g:gutentags_file_list_command = 'rg\ --files'

" Convenience around slash search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

""""""""""""""""""""""""""""""
"       LOAD PLUGINS         "
""""""""""""""""""""""""""""""
packadd minpac

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('wellle/targets.vim')
call minpac#add('tpope/vim-commentary')
call minpac#add('justinmk/vim-dirvish')
call minpac#add('junegunn/vim-easy-align')
call minpac#add('tpope/vim-eunuch')
call minpac#add('ludovicchabant/vim-gutentags')
call minpac#add('michaeljsmith/vim-indent-object')
call minpac#add('tpope/vim-repeat')
call minpac#add('machakann/vim-sandwich')
call minpac#add('haya14busa/incsearch.vim')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('junegunn/vim-peekaboo')
call minpac#add('junegunn/gv.vim')
call minpac#add('simnalamburt/vim-mundo')
call minpac#add('hauleth/sad.vim')
call minpac#add('lifepillar/vim-colortemplate')
call minpac#add('wellle/visual-split.vim')
call minpac#add('andymass/vim-matchup')
call minpac#add('tpope/vim-fugitive')
call minpac#add('mattn/vim-gist')
call minpac#add('tpope/vim-rhubarb')
call minpac#add('sonph/onehalf', {'dir': 'vim'})

" Filetype & Syntax
call minpac#add('purescript-contrib/purescript-vim')
call minpac#add('LnL7/vim-nix')
call minpac#add('vmchale/dhall-vim')
call minpac#add('yuezk/vim-js')
call minpac#add('tbastos/vim-lua')
call minpac#add('HerringtonDarkholme/yats.vim')
call minpac#add('MaxMEllon/vim-jsx-pretty')
call minpac#add('martinda/Jenkinsfile-vim-syntax')

call minpac#add('norcalli/nvim-colorizer.lua', {'type': 'opt'})
packadd nvim-colorizer.lua
lua require'colorizer'.setup()

""""""""""""""""""""""""""""""
"           THEMES           "
""""""""""""""""""""""""""""""
call minpac#add('arcticicestudio/nord-vim')
call minpac#add('cidem/yui')
call minpac#add('cocopon/iceberg.vim')
call minpac#add('junegunn/seoul256.vim')
call minpac#add('NLKNguyen/papercolor-theme')
call minpac#add('rakr/vim-one')
call minpac#add('romainl/Apprentice')

call minpac#add('eraserhd/parinfer-rust', {'do':'!cargo build --release', 'type':'opt'})
call minpac#add('masukomi/vim-markdown-folding')
call minpac#add('Olical/conjure', {'type': 'opt'})
call minpac#add('nvim-treesitter/nvim-treesitter', {'type': 'opt'})
packadd nvim-treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},               -- list of language that will be disabled
  },
}
EOF

packloadall
