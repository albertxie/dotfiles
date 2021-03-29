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

# docker container ls
alias dcls="docker container ls"

# docker container bash
dcb () {
  docker exec -it $1 /bin/bash
}

git_cleanup () {
  git branch | grep $1 | while read line 
  do
    git branch -D $line
  done
}

pg_local () {
  export PGHOST="localhost"
  export PGPORT=5432
  export PGUSER="postgres"
  export PGPASSWORD=""
  export PGDATABASE="postgres"
  pgcli
}
