def my_min_1(list)
  sorted = false
  until sorted
    sorted = true
    (0..list.length - 1).each do |i|
      (i + 1...list.length).each do |j|
        if list[j] < list[i]
          list[i], list[j] = list[j], list[i]
          sorted = false
        end
      end
    end
  end
  list.first
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min_1(list)


def my_min_2(list)
  min = list.first
  list.drop(1).each do |el|
    if el < min
      min = el
    end
  end
  min
end

p my_min_2(list)

def biggest_subsum_1(list)
  result = []
  list.each_index do |idx1|
    list.each_index do |idx2|
      next if idx1 > idx2
      result << list[idx1..idx2]
    end
  end
  result.max_by { |arr| arr.reduce(:+) }.reduce(:+)
end

list2 = [5, 3, -7]
list3 = [2, 3, -6, 7, -6, 7]
p biggest_subsum_1(list2)
p biggest_subsum_1(list3)

def biggest_subsum_2(list)
  return list.max if list.all? { |v| v < 0 }
  current_sum = 0
  larger_sum = 0
  list.each_index do |idx|
    if current_sum + list[idx] > 0
      current_sum += list[idx]
      larger_sum = current_sum if current_sum > larger_sum
    elsif current_sum + list[idx] < 0
      current_sum = 0
    end
  end
  larger_sum
end

puts
list1 = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]
p biggest_subsum_2(list1) # 8
p biggest_subsum_2(list2) # 8
p biggest_subsum_2(list3) # -1
