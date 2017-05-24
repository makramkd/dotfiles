# Common zsh functionality
# 
# This file is meant to be sourced from the .zshrc, typically contained
# in the home directory.
#

# Exports

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

export EDITOR=vim

# Aliases
alias gclone="git clone"
alias gmv="git mv"
alias grm="git rm"
alias gcsam="git commit -S -a -m"
alias gs="git show"
alias gi="git init"

alias vim=nvim

# C/C++ aliases
# Install GCC6 with homebrew on Mac
alias gcc6=gcc-6
alias g++6=g++-6
alias cpp6=c++-6

# Key bindings
# For a comprehensive guide, see http://zsh.sourceforge.net/Guide/zshguide04.html

# Ensure emacs mode, depsite us being vim developers
bindkey -e

# Same line navigation
# NOTE: overrides vanilla C-b and C-f (backward-char and forward-char)
bindkey '^B' backward-word
bindkey '^F' forward-word


# Misc things
stty -ixon
