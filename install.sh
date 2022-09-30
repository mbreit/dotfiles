#!/bin/sh

stow fish git nvim tmux

./bootstrap-nvim.sh
# Replace stdin with /dev/null to fix blocking `isatty` call in fish when used
# in VSCode devcontainer
./bootstrap-fish.fish < /dev/null
