set switchbuf=usetab

set nobackup
set noswapfile

" Set default whitespace
set ts=8 sts=2 sw=2 expandtab

" Fix fugitive syntax highlighting by unsetting locale
let g:fugitive_git_executable = 'LC_ALL=C git'

let g:AutoClosePairs = {'"': '"', '[': ']', '''': '''', '(': ')', '{': '}'}

" Customizations for surround plugin
" Ruby
" Use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}"   " v
let g:surround_35  = "#{\r}"   " #

let g:markdown_fenced_languages = ['ruby', 'erb=eruby', 'html', 'haml', 'css', 'sass', 'scss', 'javascript']

augroup default
  " Delete all autocmds in this group
  au!

  autocmd FileType ruby_debugger_window setlocal tabstop=35

  " Source the vimrc file after saving it
  autocmd bufwritepost .vimrc source $MYVIMRC

  " Fix fugitive folding commit diffs by default
  autocmd FileType git :setlocal foldlevel=99

  " Fold coffeescript by indent and intent with 2 spaces
  autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
  autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

  autocmd BufNewFile,BufReadPost *.tex setl makeprg=pdflatex\ %
augroup end

let g:dbext_default_dict_show_owner=0

let g:yankring_replace_n_pkey = '<C-L>'

let g:ruby_debugger_no_maps = 1

let g:vroom_use_vimux = 1

" Load manpage support
runtime! ftplugin/man.vim

if &term == "screen"
  set t_kN=[6;*~
  set t_kP=[5;*~
endif

if &term == "screen-256color"
  set t_kN=[6;*~
  set t_kP=[5;*~
endif


autocmd FileType haml let b:switch_definitions =
        \ [
        \ g:switch_builtins.ruby_hash_style,
        \ g:switch_builtins.ruby_if_clause,
        \ g:switch_builtins.rspec_should,
        \ g:switch_builtins.rspec_be_true_false,
        \ g:switch_builtins.ruby_tap,
        \ g:switch_builtins.ruby_string,
        \ g:switch_builtins.ruby_array_shorthand,
        \ ]

