require 'lmdb'
require './constants'
WAIT = 180

db = LMDB.new(DB_NAME, :mapsize => MAPSIZE).database
w = File.open('collection.md', 'w')

w.print <<-EOS
# Tansei 4 Collection
EOS

count = 0
db.each {|r|
  fn, cid = r
  fn = fn.sub(".copc.laz", "")
  url = "https://viewer.copc.io/?copc=https://x.optgeo.org/ipfs/#{cid}"
  img_path = "img/#{fn}.jpg"
  cmd = <<-EOS
npx playwright screenshot --wait-for-timeout=#{WAIT * 1000} \
"#{url}" #{img_path}
  EOS
  w.print <<-EOS
## #{fn}
[![#{fn}:#{cid}](#{img_path})](#{url})

  EOS
  print cmd
  system cmd
  w.flush
}

w.close
