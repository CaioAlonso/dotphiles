set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
"Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'VundleVim/Vundle.vim'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/neocomplcache.vim'
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-unimpaired'
Plug 'rking/ag.vim'
Plug 'kassio/neoterm'
Plug 'benekastah/neomake'
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'

" haskell
"Plug 'neovimhaskell/haskell-vim'
"Plug 'eagletmt/neco-ghc'
"Plug 'eagletmt/ghcmod-vim'
"Plug 'bitc/vim-hdevtools'
"Plug 'lukerandall/haskellmode-vim'
"Plug 'nbouscal/vim-stylish-haskell'
"Plug 'enomsg/vim-haskellConcealPlus'
call plug#end()

filetype plugin indent on    " required
let g:haddock_browser = "chromium"
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:␣
set autoread
set encoding=utf-8
inoremap <C-k> <Esc>
command! W :w

" neco-ghc
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :GhcModTypeInsert<CR>
au FileType haskell nnoremap <buffer> <silent> <F4> :HdevtoolsInfo<CR>
let g:syntastic_auto_loc_list=1
let g:syntastic_haskell_checkers = ["hdevtools", "hlint"]
let g:syntastic_javascript_checkers = ["jshint"]
let g:ctrlp_extensions = ['tag']

" search the whole project easily
nnoremap <Leader>/ :Ag ''<Left>

" search for the current word or selection in the whole project
" (° is <A-*> on Mac; neither <A-*> nor <S-A-8> work for some reason)
"nnoremap     :Ag '\b<C-R>=expand("<cword>")<CR>\b'<CR>
"xnoremap ° "sy:Ag '<C-R>s'<CR>
set clipboard=unnamed,unnamedplus


" sensible.vim - Defaults everyone can agree on
" Maintainer:   Tim Pope <http://tpo.pe/>
" Version:      1.1

if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 1
endif

if has('autocmd')
  filetype plugin indent on
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

" vim:set ft=vim et sw=2:
" end vim-sensible
set wildignore+=*/node_modules/*,*/deps/*
