# Your solution should have a linear - O(n) runtime, where n is the combined
# length of the input strings.
#
# Scoring: 8 points maximum
#   4 points awarded for passing all seven test cases
#   4 points awarded for linear runtime
#
# This component of the assessment is estimated to take 10 minutes.

def two_sum?(arr, target)
  hash = Hash.new

  arr.each do |el|
    return true if hash[target-el]
    hash[el] = true
  end
  false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

def largest_contiguous_subsum(list)
  max = list.first
  current_sum = 0

  list.each do |el|
    el > (current_sum + el) ? current_sum = el : current_sum += el
    max = current_sum if current_sum > max
  end
  max
end

# Big-O O(n)

list = [5, 3, -7]
p largest_contiguous_subsum(list) # => 8

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # 8 

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # -1 

def char_count(str)
  count = Hash.new(0)
  str.each_char { |char| count[char] += 1 }
  count
end

def anagrams(str_1, str_2)
  char_count(str_1) == char_count(str_2)
end

# Test Cases
p anagrams("restful", "fluster")    # => true
p anagrams("zyyx", "zyxy")          # => true
p anagrams("base", "case")          # => false
p anagrams("taco", "cat")           # => false
p anagrams("cat", "taco")           # => false
p anagrams("zyyx", "zyx")           # => false
p anagrams("zyx", "zyyx")           # => false