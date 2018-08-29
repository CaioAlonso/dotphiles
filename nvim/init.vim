set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required

call plug#begin()
Plug 'dracula/vim'

" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'ctrlpvim/ctrlp.vim'

Plug 'https://github.com/fatih/vim-go'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'prettier/vim-prettier'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration 
Plug 'w0rp/ale'

Plug 'tpope/vim-unimpaired'
call plug#end()

set number relativenumber
let g:deoplete#enable_at_startup = 1
let g:go_fmt_command = "goimports"
" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/local/bin/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1
" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" leader space
let mapleader=" "

let g:airline_theme='dracula'
set tabstop=4
syntax on
color dracula
set termguicolors

set autowrite

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" ctrlp ignore files in gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
