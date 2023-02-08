while gets
  fn = $_.split[-1]
  print <<-EOS
mc cat godo31/tansei/#{fn} | IPFS_PATH=/home/pi/ipfs ipfs add --stdin-name #{fn} --progress
  EOS
end

