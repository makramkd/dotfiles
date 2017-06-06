require 'pp'
require_relative './gitconfig_parse'

# A simple script that parses a git config file and
# places it into a hash for easy usage

# The only argument is the filename
if ARGV.size == 0 || ARGV[1] == "help" || ARGV[1] == "--help"
  p "Usage: ruby gitconfig_parser.rb [config-filepath]"
  exit 1
end

filepath = ARGV[0]
pp gitconfig_parse(File.open(filepath, 'r'))
