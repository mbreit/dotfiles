command! Guard execute 'silent !tmux splitw -h -l 60 "bundle exec guard"' | redraw!
command! Pry execute 'silent !tmux splitw -l 10 pry' | redraw!
command! Devlog execute 'silent !tmux splitw -l 20 "tail -fn 50 log/development.log"' | redraw!
command! Vimrc edit $MYVIMRC
command! Rdebug Rdebugger 'script/rails s'
command! Migrate Rake db:migrate
command! Routes Rake routes
command! Vcucumber Start bundle exec cucumber
command! Spec Rake spec
command! -nargs=* Vbundle Start bundle <args>
command! -nargs=* Task execute '!task <f-args>'
command! TasksOpen execute 'silent !task > /tmp/tasks' | redraw! | pedit /tmp/tasks
command! Mailcatcher execute '!mailcatcher ; gnome-open http://localhost:1080'
command! Freload execute 'silent !echo reload | nc localhost 32000' | redraw!

command! -nargs=+ -complete=customlist,dbext#DB_completeTables Describe :DBDescribeTable '<args>'

command! -nargs=* Vagrant Dispatch vagrant <args>
command! Vup Vagrant up
command! Vdestroy Vagrant destroy
command! Vprovision Vagrant provision
command! Vsuspend Vagrant suspend
command! -nargs=* Vssh Vagrant ssh <args>
