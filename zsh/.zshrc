# Path to your dotfiles
DOTFILES_PATH=$HOME/.local/dotfiles

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

source $DOTFILES_PATH/zsh/zgen/zgen.zsh

if ! zgen saved; then
    zgen oh-my-zsh

    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/ruby
    zgen oh-my-zsh plugins/rake-fast
    zgen oh-my-zsh plugins/rvm
    zgen oh-my-zsh plugins/bundler
    zgen oh-my-zsh plugins/kubectl
    zgen oh-my-zsh plugins/systemd
    zgen oh-my-zsh plugins/emacs
    zgen oh-my-zsh plugins/tmux

    zgen load djui/alias-tips
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-completions src
    zgen load zsh-users/zsh-history-substring-search
    zgen load zsh-users/zsh-autosuggestions
    zgen load littleq0903/gcloud-zsh-completion src

    # zgen load robbl/spaceship-zsh-theme
    zgen load denysdovhan/spaceship-zsh-theme

    # save all to init script
    zgen save
fi

# Customize to your needs...

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


# Set default editor to vim
# export EDITOR="emacsclient -nw"
# export ALTERNATE_EDITOR="emacs -nw"
export VISUAL="$EDITOR"
export TMPDIR=/tmp

# Disable zsh spelling correction
# unsetopt correct_all

# Load zmv
autoload zmv

# Shortcut function to run rake tasks in the dotfiles directory
function dotfiles {
  cd $DOTFILES_PATH
  rake $@
  cd -
}


# Local additions that should not be checked into the dotfiles repository
[[ -s $HOME/.zshrc.local ]] && source $HOME/.zshrc.local

# Set some aliases
alias gs='git st'
alias gst='git st'
alias gco='git co'
alias gcob='git cob'
compdef _git gcob=git-checkout
alias gcot='git cot'
compdef _git gcot=git-checkout
alias gl='git l'
compdef _git gl=git-log
alias gll='git ll'
compdef _git gla=git-log
alias gla='git la'
compdef _git gll=git-log
alias glla='git lla'
compdef _git glla=git-log
alias gd='git diff'
compdef _git gd=git-diff
alias gds='git diff --staged'
compdef _git gds=git-diff
alias -- +='git add'
compdef _git +=git-add
alias -- g-='git reset HEAD -- '
compdef _git -=git-reset
alias -- -='cd -'

alias up='cd `git rev-parse --show-toplevel` && git-up'

alias feature='git flow feature'
compdef _git-flow feature=git-flow-feature

#alias vim='vim --servername VIM'

alias t='tmux attach -t $PWD:t || tmux new -s $PWD:t'

alias o='gnome-open'

alias p='cd `git rev-parse --show-toplevel`'


alias y='yaourt'
alias yu='yaourt -Syu'
alias yua='yaourt -Syua'

# Ruby/Rails settings

# Misc settings

# Add ~/.local/bin to the path (e.g. for python packages)
export PATH=$PATH:$HOME/.local/bin

# Load tmuxinator if installed
# [[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Set TERM to use 256 colors if set to xterm
[[ "x$TERM" == "xxterm" ]] && export TERM="xterm-256color"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

source <(kubectl completion zsh)
