#!/bin/sh

# Replace stdin with /dev/null to fix blocking `isatty` call in fish when used
# in VSCode devcontainer
stow fish && ./bootstrap-fish.fish </dev/null
stow git
stow nvim && ./bootstrap-nvim.sh
stow tmux
