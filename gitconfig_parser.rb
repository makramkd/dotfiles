require 'pp'

# A simple script that parses a git config file and
# places it into a hash for easy usage

# The only argument is the filename
if ARGV.size == 0 || ARGV[1] == "help" || ARGV[1] == "--help"
  p "Usage: ruby gitconfig_parser.rb [config-filepath]"
  exit 1
end

filepath = ARGV[0]
config_file = File.open(filepath, 'r')

config_hash = {}
current_stanza = nil
while line = config_file.gets
  if line[0] == '['
    current_stanza = line[1..line.size-3]
    config_hash[current_stanza] = Hash.new
  else
    nowhitespace = line.gsub(/\s+/, "")
    splitstring = nowhitespace.split('=')
    config_hash[current_stanza][splitstring[0]] = splitstring[1]
  end
end

pp config_hash
