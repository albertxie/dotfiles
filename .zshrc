alias rs='bundle exec rails s'
alias rc='bundle exec rails c'
alias ff='fzf | pbcopy'

# rubocop 
rcop() {
  bundle exec rubocop -a $1
}

# verbose curl
vcurl() {
  curl -s -L -I -vvv -D - $1
}

