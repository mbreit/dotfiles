#!/bin/sh

# Bootstrap a devcontainer environment
# Only supports debian/ubuntu for now and expects passwordless sudo

NEOVIM_VERSION=v0.9.5
# NEOVIM_VERSION=nightly

mkdir -p ~/.local ~/.config ~/.cache
# Fix ownership for ~/.local or ~/.config in case it is a docker volume
sudo chown -R $(id -u):$(id -g) ~/.local ~/.config ~/.cache

# Install debian packages
sudo apt-get update
sudo apt-get install -y --no-install-recommends procps htop openssh-client less fish wget stow ca-certificates git build-essential curl fzf tmux ripgrep unzip

# Install uv for fast Python tool installation (e.g. MCP tools)
curl -LsSf https://astral.sh/uv/install.sh | sh

if ! command -v npm >/dev/null 2>&1
then
  sudo apt-get install -y --no-install-recommends npm
fi

if [ ! -f /usr/bin/nvim ] && [ ! -f /usr/local/bin/nvim ]
then
  TEMP_FILE=$(mktemp)
  curl -Lo "$TEMP_FILE" https://github.com/neovim/neovim/releases/download/$NEOVIM_VERSION/nvim-linux64.tar.gz
  sudo tar -xzf "$TEMP_FILE" -C /opt
  sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/
  rm "$TEMP_FILE"
  sudo sh -c "echo /usr/bin/fish >> /etc/shells"
fi

sudo chsh -s /usr/bin/fish $(whoami)

# Install dotfiles
./install.sh
