# Common zsh functionality
#
# This file is meant to be sourced from the .zshrc, typically contained
# in the home directory.
#

dir="$(dirname "$0")"

autoload -U compinit && compinit

# Compinstall basics
fpath=(/usr/local/share/zsh-completions $fpath)
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e

# Exports
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

export EDITOR=vim

# Key bindings
# For a comprehensive guide, see http://zsh.sourceforge.net/Guide/zshguide04.html
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
