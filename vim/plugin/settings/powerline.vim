" set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
"python from powerline.bindings.vim import source_plugin; source_plugin()

let g:Powerline_symbols = 'fancy'

" Fix powerline colorscheme after reloading vimrc
if exists('g:Powerline_loaded')
  PowerlineReloadColorscheme
endif

