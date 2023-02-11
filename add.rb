require 'lmdb'
require './constants'

db = LMDB.new(DB_NAME, :mapsize => MAPSIZE).database

count = 0
while gets
  fn = $_.split[-1]
  cid = db[fn]
  count += 1
  if cid
    print "#{count}: existing #{fn}: #{cid}\n"
  else
    cmd = <<-EOS
mc cat #{SRC_DIR}/#{fn} | IPFS_PATH=#{IPFS_PATH} ipfs add --stdin-name #{fn} --progress
    EOS
    r = `#{cmd}`.split
    cid = r[1]
    fn = r[2]
    if BAD_CIDS.include?(cid)
      print "#{count}: error on #{fn}: #{cid}\r"
    else
      db[fn] = cid
      print "#{count}: added #{fn}: #{cid}\n"
    end
  end
end

