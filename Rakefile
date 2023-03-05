desc 'add COPC files to IPFS'
task :add do
  sh <<-EOS
mc ls godo33/tansei | ruby add.rb
  EOS
end

desc 'update view.md'
task :view do
  sh <<-EOS
ruby view.rb > view.md
  EOS
end

