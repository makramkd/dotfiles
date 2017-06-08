# bundle/rails aliases

alias b="bundle"
alias bex="bundle exec"
alias bi="bundle install"
alias bsh="bundle show"
alias brc="bundle exec rails console"
alias brs="bundle exec rails server"
alias bra="bundle exec rake"
alias brdbm="bundle exec rake db:migrate"
alias brdbc="bundle exec rake db:create_migration"
alias brsp="bundle exec rspec"

# Macro to prepare a rails project to be used via
# console or rails server
function prep() {
  git pull
  bundle install
  bundle exec rake db:migrate
  echo 'Done! Project Ready!'
}

function rrun() {
  prep
  bundle exec rails server
}
