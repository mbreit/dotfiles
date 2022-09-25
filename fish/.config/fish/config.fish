set -g fish_greeting ""

if test -x /usr/bin/nvim
  set -g EDITOR nvim
else if test -x /usr/bin/vim
  set -g EDITOR vim
end
