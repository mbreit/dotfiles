#!/bin/sh

# Bootstrap a devcontainer environment
# Only supports debian/ubuntu for now and expects passwordless sudo

mkdir -p ~/.local ~/.config
# Fix ownership for ~/.local or ~/.config in case it is a docker volume
sudo chown -R $(id -u):$(id -g) ~/.local ~/.config

# Install debian packages
sudo apt-get update
sudo apt-get install -y --no-install-recommends procps htop openssh-client less fish neovim rake

# Install dotfiles
rake install

# Initialize fundle for fish plugins
fish -i -c "source fish/conf.d/plugins.fish && fundle install"
