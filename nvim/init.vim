set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required

call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }

" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'ctrlpvim/ctrlp.vim'

Plug 'prettier/vim-prettier'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration 
Plug 'w0rp/ale'

Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdtree'
Plug 'jiangmiao/auto-pairs'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

set number relativenumber

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" leader space
let mapleader=" "

let g:airline_theme='dracula'
set tabstop=4
set shiftwidth=4
autocmd FileType go setlocal softtabstop=0 noexpandtab
autocmd FileType javascript setlocal ts=2 sw=2 sts=0 noexpandtab
autocmd FileType json setlocal ts=2 sw=2 sts=0 noexpandtab

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
"let b:ale_fixers = {'go': ['gometalinter']}
"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)

" ctrlp ignore files in gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" fix for allowing overwrites
let g:UltiSnipsDontReverseSearchPath="1"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" press jj to escape insert mode
imap jj <Esc>

" ctrl+c to copy
vmap <C-c> "+y
" ctrl+v to paste
nmap <C-v> "+gp

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
