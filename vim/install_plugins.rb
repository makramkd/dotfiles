# Installs plugins so that they can be used by pathogen
# i.e make sure you have pathogen setup: https://github.com/tpope/vim-pathogen
# Note that this is most likely incorrect for windows

vim_plugins_directory = '~/.vim/bundle'
remotes = File.open('/Users/makram/dotfiles/vim/installed_plugins.txt').read
remotes.each_line do |line|
  `git clone #{line} #{vim_plugins_directory}/#{line.split('/').last.split('.').first}`
end
