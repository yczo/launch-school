names = ['Bob', 'Joe']
names.each { |name| puts name }

x = 1

names.each do |name|
  puts "#{x}. #{name}"
  x += 1
end