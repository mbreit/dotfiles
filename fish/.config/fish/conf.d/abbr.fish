if status --is-interactive
    abbr -a -g -- ! 'eval sudo $history[1]'
    abbr -a -g -- - 'cd -'
    abbr -a -g -- au 'sudo apt update && sudo apt dist-upgrade'
    abbr -a -g -- bi 'bundle install'
    abbr -a -g -- dc docker-compose
    abbr -a -g -- dcb 'docker-compose build'
    abbr -a -g -- dcd 'docker-compose down'
    abbr -a -g -- dcr 'docker-compose run --rm'
    abbr -a -g -- dcra 'docker-compose run --rm app'
    abbr -a -g -- dcrm 'docker-compose run --rm app bin/rails db:migrate'
    abbr -a -g -- dcrr 'docker-compose run --rm app bin/rails'
    abbr -a -g -- dcrs 'docker-compose run --rm app bin/rspec'
    abbr -a -g -- dcu 'docker-compose up'
    abbr -a -g -- g git
    abbr -a -g -- gs 'git st'
    abbr -a -g -- gst 'git status'
    abbr -a -g -- k kubectl
    abbr -a -g -- l 'exa -la'
    abbr -a -g -- la 'exa -la'
    abbr -a -g -- o xdg-open
    abbr -a -g -- p 'cd (git rev-parse --show-toplevel)'
    abbr -a -g -- rc 'bin/rails console'
    abbr -a -g -- rdbm 'bin/rails db:migrate'
    abbr -a -g -- rs 'bin/rails server'
    abbr -a -g -- t 'tmux new-session -At (basename (pwd))'
    abbr -a -g -- ti 'trivy image --ignore-unfixed --scanners vuln'
end
