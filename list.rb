require 'lmdb'
require './constants'

db = LMDB.new(DB_NAME, :mapsize => 1099511627776).database

File.foreach("list.txt") {|l|
  r = l.strip.split
  fn = r[2]
  cid = r[1]
  if BAD_CIDS.include?(cid)
  else
    db[fn] = cid
  end
}

