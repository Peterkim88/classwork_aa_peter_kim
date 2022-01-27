# Write a method `linear_longest_word` that accepts an array of strings.
# The method should return the longest string in the array. You can assume
# that the array will contain at least one string and there will not be a tie.
#
# Your solution should have a linear - O(n) runtime, where n is the length of
# the array
#
# Scoring: 8 points maximum
#   4 points awarded for passing all test cases
#   4 points awarded for linear runtime
#
# This component of the assessment is estimated to take 10 minutes.

def linear_longest_word(arr)
  largest = ""
  # current = arr.first

  # (1...arr.length).each do |word|
  #   if word.length
  arr.each do |str|
    if str.length > largest.length
      largest = str
    end
  end
  largest
end

# Test Cases:
p linear_longest_word(['soda', 'mechanic', 'sky', 'stone']) # 'mechanic'
p linear_longest_word(['excellent', 'cat', 'sweep']) # 'excellent'
p linear_longest_word(['door']) # 'door'
