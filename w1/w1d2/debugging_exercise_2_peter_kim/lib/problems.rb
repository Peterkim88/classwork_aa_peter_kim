# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"
def largest_prime_factor(num)
    
    n = num
    while n > 0
        if num % n == 0 && prime?(n)
            return n
        end
        n -= 1
    end
end

def prime?(num)
    if num < 2
        return true
    end

    (2...num).each do |n|
        if num % n == 0
            return false
        end
    end
    return true
end
# puts prime?(7)
# puts prime?(12)
# puts prime?(2)

def unique_chars?(str)
    (0...str.length - 1).each do |idx1|
        (idx1+1...str.length).each do |idx2|
            if str[idx1] == str[idx2]
                return false
            end
        end
    end
    return true
end

def dupe_indices(arr)
    hash = Hash.new { |h, k| h[k] = [] }
    arr.each_with_index { |el, idx| hash[el] << idx }
    hash.select { |k, v| v.length > 1 }
end

def ana_array(arr1, arr2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    arr1.map { |el1| hash1[el1] += 1 }
    arr2.map { |el2| hash2[el2] += 1 }
    hash1 == hash2
end