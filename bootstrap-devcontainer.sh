#!/bin/sh

# Bootstrap a devcontainer environment
# Only supports debian/ubuntu for now and expects passwordless sudo

sudo apt-get update
sudo apt-get install -y --no-install-recommends openssh-client less fish neovim rake
rake install
