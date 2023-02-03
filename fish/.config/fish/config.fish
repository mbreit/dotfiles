set -g fish_greeting ""

if test -x /usr/bin/nvim
  set -g EDITOR nvim
else if test -x /usr/bin/vim
  set -g EDITOR vim
end

set kube_configs ~/.kube/*.config
if count $kube_configs >/dev/null
  set -gx KUBECONFIG (string join ":" $kube_configs)
end
set -gx PATH $PATH $HOME/.krew/bin
