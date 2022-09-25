#!/bin/sh

nvim --headless -u ~/.config/nvim/lua/user/plugins.lua -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
