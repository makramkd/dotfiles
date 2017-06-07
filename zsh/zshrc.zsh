# Common zsh functionality
# 
# This file is meant to be sourced from the .zshrc, typically contained
# in the home directory.
#

dir="$(dirname "$0")"

# Exports
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

export EDITOR=vim

# Aliases
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

# Custom aliases and functions
local -a plugins
plugins=(rails.zsh git.zsh utility.zsh)

# Don't loop through current directory because we'd recursively 
# source this file
for i in $plugins; do
  source $dir/$i end
done
