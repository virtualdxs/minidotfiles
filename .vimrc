colorscheme solarized
set background=dark
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when hitting <BS>, pretend like a tab is removed, even     if spaces
set softtabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set autoindent
set copyindent

inoremap {<cr> {<CR><Tab><CR><BS>}<Esc>-cc

syntax on
