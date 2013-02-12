# Path to your dotfiles
DOTFILES_PATH=$HOME/.local/dotfiles

# Path to your oh-my-zsh configuration.
ZDOTDIR=$DOTFILES_PATH/zsh
PREZTO_PATH=$ZDOTDIR/.zprezto

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(debian history-substring-search gem git github rvm bundler rails3 rake capistrano vagrant git-flow psql zsh-syntax-highlighting)

# Load oh-my-zsh
source $PREZTO_PATH/init.zsh

# Disable zsh spelling correction
unsetopt correct_all

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

alias vim='vim --servername VIM'


# Ruby/Rails settings

# Load rvm if it is installed to ~/.rvm and the current user is not root (to
# avoid warning when using sudo)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && [[ $USER != "root" ]] && . "$HOME/.rvm/scripts/rvm"

# Add rvm executables to the path
PATH=$PATH:$HOME/.rvm/bin

# Tweak ruby garbage collector for faster rails startup
RUBY_FREE_MIN=200000
RUBY_GC_MALLOC_LIMIT=60000000


# Misc settings

# Add ~/.local/bin to the path (e.g. for python packages)
PATH=$PATH:$HOME/.local/bin

# Load tmuxinator if installed
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator ]]

# Set default editor to vim
EDITOR=vim

# Set TERM to use 256 colors if set to xterm
[[ "x$TERM" == "xxterm" ]] && TERM="xterm-256color"

# Load powerline prompt if it is installed to
# ~/.local/lib/python2.7/site-packages
POWERLINE_PATH=$HOME/.local/lib/python2.7/site-packages/powerline
[[ -s $POWERLINE_PATH/bindings/zsh/powerline.zsh ]] && source $POWERLINE_PATH/bindings/zsh/powerline.zsh
