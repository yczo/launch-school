require 'pathname'
puts File.extname("simple_file.txt")

d = Dir.new(".")

while file = d.read do
  puts "Yeh" if File.extname(file) == ".rb"
end