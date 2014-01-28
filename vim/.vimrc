set nocompatible

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" Create directory for temporary files
silent !mkdir -p ~/.local/share/vim/swap > /dev/null 2>&1
silent !mkdir -p ~/.local/share/vim/backup > /dev/null 2>&1
silent !mkdir -p ~/.local/share/vim/undo > /dev/null 2>&1

" Initialize pathogen
if filereadable(expand("~/.vim/bundle/vim-pathogen/autoload/pathogen.vim")) && !exists("g:loaded_pathogen")
  runtime bundle/vim-pathogen/autoload/pathogen.vim
  call pathogen#infect()
  call pathogen#helptags()
endif

" Load sensible.vim early to allow overriding settings
runtime! plugin/sensible.vim

syntax on
filetype plugin indent on

" General vim configuration
let mapleader = "," " Set leader key to , instead of \

set number      " Show linenumbers
set linebreak   " Wrap lines at convenient points

set hlsearch    " highlight search results
set list
set wildmode=list:longest
set wildignore+=*/tmp/*

set tags=.tags,.gemtags,./.tags,./.gemtags

" Enable mouse
set mouse=a
set ttymouse=xterm2

set smartindent
set encoding=utf-8
set hidden
set visualbell
set cursorline
set ttyfast
set textwidth=79
set formatoptions=rn1

" disable arrow keys
" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>
" imap <up> <nop>
" imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
