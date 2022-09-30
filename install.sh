#!/bin/sh

stow fish git nvim tmux

./bootstrap-nvim.sh
# ./bootstrap-fish.fish
sleep 10
fish --debug='complete,*history*' --debug-output=/tmp/fish.log --init-command='set fish_trace on' ./bootstrap-fish.fish
