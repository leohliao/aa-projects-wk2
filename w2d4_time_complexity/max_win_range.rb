# quardratic time
# constant space
def naive_solution(array, window_size)
  current_max_range = 0
  ws = window_size - 1
  (0...array.length-ws).each do |i|
    (i + 1..i + ws).each do |j|
      window = array[i..j]
      range = window.max - window.min
      current_max_range = range if range > current_max_range
    end
  end
  current_max_range
end
p naive_solution([1, 0, 2, 5, 4, 8], 2) #== 4 # 4, 8
p naive_solution([1, 0, 2, 5, 4, 8], 3) #== 5 # 0, 2, 5
p naive_solution([1, 0, 2, 5, 4, 8], 4) #== 6 # 2, 5, 4, 8
p naive_solution([1, 3, 2, 5, 4, 8], 5) #== 6 # 3, 2, 5, 4, 8
