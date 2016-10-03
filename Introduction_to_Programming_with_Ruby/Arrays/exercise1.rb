arr = [1, 2, 3, 4, 5]
new_arr = []

new_arr = arr.map do |n|
  n + 2
end

p arr
p new_arr