# quadratic time
# quadratic space

def bad_two_sum?(arr, target)
  result = []
  arr.each_index do |idx1|
    arr.each_index do |idx2|
      next if idx1 == idx2
      result << arr[idx1] + arr[idx2]
    end
  end
  result.include?(target)
p result.length
end
arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6)
p bad_two_sum?(arr, 10)

# time complexity : linearithmic
# constant space O(1)
def ok_two_sum?(arr, target)
  sorted = arr.sort
  sorted.each_with_index do |num1, idx1|
    idx2 = sorted.bsearch_index { |num2| num1 == target - num2 }
    if idx2
      return true if idx1 != idx2
    end
  end

  false
end

arr = [0, 1, 5, 7]
p ok_two_sum?(arr, 6)
p ok_two_sum?(arr, 10)

def hashmap?(arr, target)
  hash = Hash.new(target)
  arr.each do |num|
    hash[num] -= num
  end
  hash.each do |key, val|
    return true if hash.keys.include?(val) && key != val
  end
  false


end
arr = [0, 1, 5, 7]
p hashmap?(arr, 6)
p hashmap?(arr, 10)
