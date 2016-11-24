# A really simplistic git config parser
# Returns a hash format
def gitconfig_parse(file)
  config_hash = {}
  current_stanza = nil
  while line = file.gets
    if line[0] == '['
      current_stanza = line[1..line.size-3]
      config_hash[current_stanza] = Hash.new
    else
      nowhitespace = line.gsub(/\s+/, "")
      splitstring = nowhitespace.split('=')
      config_hash[current_stanza][splitstring[0]] = splitstring[1]
    end
  end

  config_hash
end
