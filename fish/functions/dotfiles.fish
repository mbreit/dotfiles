function dotfiles
    cd ~/.local/dotfiles
    rake $argv
    cd -
end
