require_relative './gitconfig_parse'

# A simple ruby script that scans the folders in the ~/.vim/bundle directory,
# parses the git configs in each directory, and gets the git remote.

# We only need the vim bundle path
if ARGV.size == 0 || ARGV[0] == 'help' || ARGV[0] == '--help'
  p "Usage: ruby vim_plugin_remotes.rb [vim-bundle-path]"
  exit 1
end

REMOTE_ORIGIN_KEY = "remote \"origin\""
CONFIG_PATH = ".git/config"

vim_bundle_path = ARGV[0]
directories = Dir.entries(vim_bundle_path).select {|entry| File.directory? File.join(vim_bundle_path,entry) and !(entry =='.' || entry == '..') }

remotes = []
directories.each do |directory|
  config_hash = gitconfig_parse(File.open(vim_bundle_path + "/" + directory + "/" + CONFIG_PATH))
  remote_url = config_hash[REMOTE_ORIGIN_KEY]["url"]
  remotes << remote_url
end

output_file = "installed_plugins.txt"
File.open(output_file, 'w') do |f|
  remotes.each do |remote|
    f.puts remote
  end
end
