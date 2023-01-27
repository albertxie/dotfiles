#!/usr/bin/env bash
# vim: set filetype=ruby:
# h - browse Chrome history with fzf

[ $(uname) = Darwin ] || exit 1
which fzf > /dev/null 2>&1 || brew reinstall --HEAD fzf || exit 1

/usr/bin/ruby -x "$0"                                          |
  fzf-tmux -u 30% --ansi --multi --no-hscroll --tiebreak=begin |
  awk 'BEGIN { FS = "\t" } { print $2 }'                       |
  xargs open
exit $?

#!ruby
# encoding: utf-8

require 'sqlite3'

DB_PATH = "/Users/#{ENV['USER']}/Library/Application Support/Google/Chrome/Default/History"
CJK  = /\p{Han}|\p{Katakana}|\p{Hiragana}|\p{Hangul}/

db = SQLite3::Database.new DB_PATH

def just str, width
  str.ljust(width - str.scan(CJK).length)
end

def trim str, width
  len = 0
  str.each_char.each_with_index do |char, idx|
    len += char =~ CJK ? 2 : 1
    return str[0, idx] if len > width
  end
  str
end

width = `tput cols`.strip.to_i / 2

begin
  db.execute( "select * from urls order by last_visit_time desc limit 10000" ) do |row|
    _id, url, title = row
    title = trim(title, width)
    puts [just(title, width), url] .join("\t")
  end
rescue => e
  puts "You must exit Google Chrome before searching for history"
ensure
  db.close
end
