" Easy window navigation
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

" Remap indentation
vmap > >gv
vmap < <gv
vmap <Tab> >gv
vmap <S-Tab> <gv
inoremap <c-space> <c-n>

nnoremap <F8> :sbnext<CR>
nnoremap <S-F8> :sbprevious<CR>

" Map personal hotkeys
nmap <leader>l :set list!<CR>
nmap <leader>n :set number!<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nmap <Leader>m :make<CR>
inoremap <C-v> <ESC>:VimuxRunLastCommand<CR>

" Setup mappings for ruby-debugger.
nmap <leader>db <plug>ruby_debugger_breakpoint
nmap <leader>dv <plug>ruby_debugger_open_variables
nmap <leader>dm <plug>ruby_debugger_open_breakpoints
nmap <leader>dt <plug>ruby_debugger_open_frames
nmap <leader>ds <plug>ruby_debugger_step
nmap <leader>df <plug>ruby_debugger_finish
nmap <leader>dn <plug>ruby_debugger_next
nmap <leader>dc <plug>ruby_debugger_continue
nmap <leader>de <plug>ruby_debugger_exit
nmap <leader>dd <plug>ruby_debugger_remove_breakpoints

nmap <leader>rs :silent Rserver!<CR>:redraw!<CR>
nmap <leader>rd :Rdebugger 'script/rails s'<CR>
nmap <leader>p :Pry<CR>

" Setup mapping for switch.vim
nnoremap - :Switch<cr>
