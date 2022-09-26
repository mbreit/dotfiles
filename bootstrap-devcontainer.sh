#!/bin/sh

# Bootstrap a devcontainer environment
# Only supports debian/ubuntu for now and expects passwordless sudo

mkdir -p ~/.local ~/.config ~/.cache
# Fix ownership for ~/.local or ~/.config in case it is a docker volume
sudo chown -R $(id -u):$(id -g) ~/.local ~/.config ~/.cache

# Install debian packages
sudo apt-get update
sudo apt-get install -y --no-install-recommends procps htop openssh-client less fish wget stow ca-certificates git build-essential curl fzf tmux

if [ ! -f /usr/bin/nvim ]                                                                                                                                                                   
then    
  TEMP_FILE=$(mktemp)    
  curl -Lo "$TEMP_FILE" https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb    
  sudo dpkg -i "$TEMP_FILE"    
  rm "$TEMP_FILE"    
  sudo sh -c "echo /usr/bin/fish >> /etc/shells"    
fi

sudo chsh -s /usr/bin/fish $(whoami)

# Install dotfiles
./install.sh

./bootstrap-nvim.sh
./bootstrap-fish.sh
