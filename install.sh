#!/bin/sh

# Replace stdin with /dev/null to fix blocking `isatty` call in fish when used
# in VSCode devcontainer
stow fish && ./bootstrap-fish.fish </dev/null
stow git
# Do not run bootstrap-nvim.sh for now as it does not work on older Neovim versions
stow nvim && ./bootstrap-nvim.sh
stow tmux
