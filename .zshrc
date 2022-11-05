# add gems to PATH
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# use nvim as default editor
export EDITOR="nvim"
export VISUAL="nvim"
export HGEDITOR="nvim"
alias vim="nvim"
alias vi="nvim"

export CLICOLOR=1
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
HISTSIZE=130000
SAVEHIST=130000

# compile and run c++
run() {
  filename=$1
  binary="${filename%.*}"
  clang++ -Wall -std=c++11 -pedantic -o $binary $filename
  ./$binary
}

# docker container ls
alias dcls="docker container ls"

# docker container bash
dcb () {
  docker exec -it $1 /bin/bash
}

# cleanup git branches
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

# rename zsh prompt
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "albert@home"
  fi
}

restart_audio_proxy() {
  sudo launchctl kickstart -k system/com.apple.audio.coreaudiod
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
