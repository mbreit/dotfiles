set -g fish_greeting ""

if test ! -n "$EDITOR"
    if test -x /usr/bin/nvim
        set -gx EDITOR /usr/bin/nvim
    else if test -x /usr/bin/vim
        set -gx EDITOR /usr/bin/vim
    end
end

set kube_configs ~/.kube/*.config ~/.config/k3d/*.yaml
if count $kube_configs >/dev/null
    set -gx KUBECONFIG (string join ":" $kube_configs)
end
fish_add_path -P $HOME/.krew/bin
