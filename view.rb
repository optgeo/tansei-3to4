require 'lmdb'
require './constants'

db = LMDB.new(DB_NAME, :mapsize => MAPSIZE).database

print <<-EOS
# Tansei 4
EOS

count = 0
db.each {|r|
  fn, cid = r
  print <<-EOS
1. [#{fn}:#{cid}](https://viewer.copc.io/?copc=https://x.optgeo.org/ipfs/#{cid})
  EOS
}

