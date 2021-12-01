# compile and run c++ 
cpp_run () {
  g++ -Wall -pedantic -g -o a.out $1 && ./a.out && rm a.out && rm -rf *.dSYM
}

# docker container ls
alias dcls="docker container ls"

# docker container bash
dcb () {
  docker exec -it $1 /bin/bash
}

# cleanup stale git branches
git_cleanup () {
  git branch | grep $1 | while read line 
  do
    git branch -D $line
  done
}

# shortcut to access psql
pg_local () {
  export PGHOST="localhost"
  export PGPORT=5432
  export PGUSER="postgres"
  export PGPASSWORD=""
  export PGDATABASE="postgres"
  pgcli
}

alias vim="nvim"
alias vi="nvim"
