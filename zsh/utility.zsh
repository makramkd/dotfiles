alias viz="vim ~/.zshrc"
alias viv="vim ~/.vimrc"
alias src="source ~/.zshrc"
alias c=clear
alias e=exit

# utility functions
function mkd {
  mkdir $1 && cd $1
}

function psgrep {
  ps aux | grep -v grep | grep $1
}

function getpid {
  ps aux | grep -v grep | grep $1 | awk '{print $2}'
}

function wg {
  eval $1 | grep $2
}

function encode {
  openssl enc -base64 <<< $1
}

function decode {
  openssl enc -base64 -d <<< $1
}

function validate_erb {
  erb -P -x -T '-' $1 | ruby -c
}

# Delete all local branches except for master
function git-rm-branches {
  git branch | grep -v "master" | xargs git branch -D
}

function brew-update-force {
  cd $(brew --repo); git fetch; git reset --hard origin/master; brew update
}

function git-pull-all-subdirectories {
  for i in */.git; do ( echo $i; cd $i/..; git pull; ); done
}

function cpl {
  local filename=$(basename "$1")
  filename="${filename%.*}"
  clang -Wall $1 -o bin/$filename
}

function cppl {
  local filename=$(basename "$1")
  filename="${filename%.*}"
  clang++ -Wall -std=c++14 $1 -o bin/$filename
}
