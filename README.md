# dotfiles
Various dotfiles that I use, as well as vim plugins and such.

## What each thing does

There's a couple of scripts in this directory. Here's a brief overview of what they do:

### `gitconfig_parse.rb` 
Contains a really simple parser that parses the given git config into a ruby Hash object.

### `gitconfig_parser.rb`
A driver that uses the `gitconfig_parse` method declared in the previous script.

### `vim_plugin_remotes.rb`
Writes the plugins you have installed into your vim bundle directory (usually `~/.vim/bundle`)
to a file called `installed_plugins.txt`. 
