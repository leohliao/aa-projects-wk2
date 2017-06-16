# O(n * n!) factorial time
# O(n!) factorial space
def first_anagram?(first, second)
  return false unless first.length == second.length
  arr = first.chars
  possible = arr.permutation
  possible.each do |word|
    return true if second == word.join
  end
  false
end
p first_anagram?("gizmo", "sally")
p first_anagram?("elvis", "lives")

# O(n^2) quadratic time
# O(n) linear space
def second_anagrams?(first, second)
  arr1 = first.chars
  arr2 = second.chars
  arr1.each do |ch|
    first.delete!(ch)
    second.delete!(ch)
  end
  return true if first.empty? && second.empty?
  false

end
p second_anagrams?("gizmo", "sally")
p second_anagrams?("elvis", "lives")

# O(nlog(n)) linearithmic time
# O(n) linear space
def third_anagrams?(first, second)
  return true if first.chars.sort == second.chars.sort
  false

end

p third_anagrams?("gizmo", "sally")
p third_anagrams?("elvis", "lives")

def fourth_anagrams?(first, second)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  first.each_char do |ch|
    hash1[ch] += 1
  end
  second.each_char do |ch|
    hash2[ch] += 1
  end

  return true if hash1.sort_by { |k, _| k } - hash2.sort_by { |k, _| k } == []

  false
end


p fourth_anagrams?("gizmo", "sally")
p fourth_anagrams?("elvis", "lives")
