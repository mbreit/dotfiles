set -g fish_greeting ""

if test -x /usr/bin/nvim
  set -g EDITOR nvim
else if test -x /usr/bin/vim
  set -g EDITOR vim
end

set -gx KUBECONFIG (string join ":" (ls ~/.kube/*.config))
set -gx PATH $PATH $HOME/.krew/bin
