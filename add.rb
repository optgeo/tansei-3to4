require 'lmdb'
require './constants'

db = LMDB.new(DB_NAME, :mapsize => 1099511627776).database

count = 0
while gets
  fn = $_.split[-1]
  cid = db[fn]
  count += 1
  if cid
    print "#{count}: #{fn}: #{cid}\n"
  else
    cmd = <<-EOS
mc cat #{SRC_DIR}/#{fn} | IPFS_PATH=#{IPFS_PATH} ipfs add --stdin-name #{fn} --progress
    EOS
    r = `#{cmd}`.split
    print "#{count}: #{r}\n"
  end
end

