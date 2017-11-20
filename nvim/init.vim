set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
Plug 'Valloric/YouCompleteMe'
Plug 'dbeniamine/vim-mail'
Plug 'tpope/vim-sensible'
" sensible.vim: Defaults everyone can agree on
Plug 'tpope/vim-fugitive'
" fugitive.vim: a Git wrapper so awesome, it should be illegal 
Plug 'Shougo/vimproc.vim'
" Interactive command execution in Vim
Plug 'Shougo/neocomplcache.vim'
" Ultimate auto-completion system for Vim
Plug 'scrooloose/syntastic'
" Syntax checking hacks for vim
Plug 'ctrlpvim/ctrlp.vim'
" Fuzzy file, buffer, mru, tag, etc finder
Plug 'vim-airline/vim-airline'
" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'
" A collection of themes for vim-airline
Plug 'Yggdroot/indentLine'
" A vim plugin to display the indention levels with thin vertical lines
Plug 'tpope/vim-unimpaired'
" pairs of handy bracket mappings
Plug 'rking/ag.vim'
" Vim plugin for the_silver_searcher, 'ag', a replacement
" for the Perl module / CLI script 'ack'
Plug 'kassio/neoterm'
" Wrapper of some neovim's :terminal functions.
"Plug 'benekastah/neomake'
" A plugin for asynchronous :make using Neovim's job-control functionality
Plug 'mattn/emmet-vim'
" emmet for vim: http://emmet.io/
Plug 'junegunn/goyo.vim'
" Distraction-free writing in Vim
Plug 'altercation/vim-colors-solarized'
" precision colorscheme for the vim text editor

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" python

" haskell
Plug 'neovimhaskell/haskell-vim'
" Syntax Highlighting and Indentation for Haskell and Cabal
Plug 'eagletmt/neco-ghc'
" a completion plugin for Haskell, using ghc-mod
Plug 'eagletmt/ghcmod-vim'
" Happy Haskell programming on Vim, powered by ghc-mod
Plug 'bitc/vim-hdevtools'
" Vim plugin for Haskell development powered by the lightnight fast hdevtools background server.
Plug 'lukerandall/haskellmode-vim'
Plug 'nbouscal/vim-stylish-haskell'
" Haskell code prettifier
"Plug 'enomsg/vim-haskellConcealPlus'
" extended Haskell Conceal feature for Vim

" javascript
Plug 'pangloss/vim-javascript'

Plug 'editorconfig/editorconfig-vim'
call plug#end()

filetype plugin indent on    " required
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_loc_list=1
let g:syntastic_haskell_checkers = ["hdevtools", "hlint"]
let g:syntastic_python_pylint_post_args = '-j 0'

let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_javascript_standard_args = ['--fix']
" enable autoread to reload any files from files when checktime is called and
" the file is changed
set autoread
" add an autocmd after vim started to execute checktime for *.js files on write
au VimEnter *.js au BufWritePost *.js checktime

let g:ctrlp_extensions = ['tag']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"let g:airline_theme='solarized'
"let g:airline_powerline_fonts=1

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

" solarized
syntax on
set background=dark
"colorscheme solarized

" run neomake on every write
"autocmd! BufWritePost * Neomake
" neomake window
"let g:neomake_open_list = 1

set relativenumber


