def two_bad_sum?(arr, target_sum)
  (0...arr.length - 1).each do |i|
    (i + 1...arr.length).each do |j|
      return true if arr[i] + arr[j] == target_sum
    end
  end
  return false
end

arr = [0, 1, 5, 7]
p "-----brute force-----"
p "O(n^2)"
p two_bad_sum?(arr, 6) # => should be true
p two_bad_sum?(arr, 10) # => should be false



def okay_two_sum?(arr, target_sum)
  sorted = arr.sort
  until sorted.length <= 1
    if sorted[0] + sorted[-1] == target_sum
      return true
    elsif sorted[0] + sorted[-1] < target_sum
      sorted.shift
    else
      sorted.pop
    end
  end
  return false
end

arr = [0, 1, 5, 7]
p "-----sorting-----"
p "O(n log n)"
p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false



# def two_sum?(arr, target_sum)
#   hash = Hash.new(0)
#   arr.each_with_index { |el, i| hash[i] += el }
#   arr.each_with_index do |ele, idx|

#     return true if hash. { |k, v| idx != k && k + ele == target_sum }
#   end
#   return false
# end


def two_sum?(arr, target_sum)
  nums = {}
  arr.each do |n|
    if nums[target_sum - n]
      return true
    end
    nums[n] = true
  end
  return false
end

arr = [0, 1, 5, 7]
p "-----hash map-----"
p "O(n)"
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false