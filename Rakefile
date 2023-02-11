task :add do
  sh <<-EOS
mc ls godo31/tansei | ruby add.rb
  EOS
end

task :view do
  sh <<-EOS
ruby view.rb > view.md
  EOS
end

