set nocompatible              " be iMproved, required
filetype off                  " required
let g:python_host_prog = 'python'

call plug#begin()
" A light and configurable statusline/tabline plugin for Vim
Plug 'itchyny/lightline.vim'

" A code-completion engine for Vim
"Plug 'Valloric/YouCompleteMe'

" Vim python-mode. PyLint, Rope, Pydoc, breakpoints from box. 
"Plug 'python-mode/python-mode'

" precision colorscheme for the vim text editor
Plug 'altercation/vim-colors-solarized'

" Fuzzy file, buffer, mru, tag, etc finder. 
Plug 'ctrlpvim/ctrlp.vim'

" yapf plugin for Vim
Plug 'mindriot101/vim-yapf'

" An asynchronous markdown preview plugin for Vim and Neovim
Plug 'euclio/vim-markdown-composer'

" An alternative sudo.vim for Vim and Neovim
Plug 'lambdalisue/suda.vim'
call plug#end()

filetype plugin indent on    " required
set relativenumber
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set number
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set autoread
set encoding=utf-8
let mapleader = ' '
inoremap <C-k> <Esc>
command! W :w
map <leader>o o<ESC>

" enable autoread to reload any files from files when checktime is called and
" the file is changed
set autoread
let g:ctrlp_extensions = ['tag']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" solarized
syntax on
" colorscheme solarized
set background=dark

" general styling
hi ColorColumn ctermbg=0
set fillchars=vert:\│
hi VertSplit ctermfg=8 ctermbg=2

" highlight cursor line
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END<Paste>

" lightline config
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

" yank to clipboard
set clipboard+=unnamedplus

" pymode
let g:pymode_python = 'python3'
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'
let g:pymode_folding = 0

" sudo save
" cnoremap sudosave w !sudo tee %
