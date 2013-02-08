set nocompatible

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" Initialize pathogen

if filereadable(expand("~/.vim/bundle/vim-pathogen/autoload/pathogen.vim")) && !exists("g:loaded_pathogen")
  runtime bundle/vim-pathogen/autoload/pathogen.vim
  call pathogen#infect()
  call pathogen#helptags()
endif

" General vim configuration

set number      " Show linenumbers
set nowrap      " Don't wrap lines
set linebreak   " Wrap lines at convenient points

set hlsearch    " highlight search results
set incsearch   " incremental search
set autowrite
set autoread
set wildmenu
set wildmode=list:longest

set tags=.tags,.gemtags,./.tags,./.gemtags

" Enable mouse
set mouse=a
set ttymouse=xterm2

set smartindent
set smarttab

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

" Persistent Undo
" Keep undo history across sessions, by storing in file.
if has("persistent_undo")
  silent !mkdir -p ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

set encoding=utf-8
set scrolloff=3
set autoindent
set showcmd
set hidden
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
" set relativenumber
set wrap
set textwidth=79
set formatoptions=rn1
" set colorcolumn=120

