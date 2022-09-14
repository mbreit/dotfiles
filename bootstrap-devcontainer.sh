#!/bin/sh

# Bootstrap a devcontainer environment
# Only supports debian/ubuntu for now and expects passwordless sudo

mkdir -p ~/.local ~/.config
# Fix ownership for ~/.local or ~/.config in case it is a docker volume
sudo chown -R $(id -u):$(id -g) ~/.local ~/.config

# Install debian packages
sudo apt-get update
sudo apt-get install -y --no-install-recommends procps htop openssh-client less fish

sudo sh -c "echo /usr/bin/fish >> /etc/shells"

# Install dotfiles
mkdir -p ~/.config
ln -sTf $(pwd)/fish ~/.config/fish

# fish -ic "fundle install"
