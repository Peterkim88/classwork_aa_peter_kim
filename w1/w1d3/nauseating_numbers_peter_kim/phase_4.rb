require "byebug"
require_relative "./phase_1.rb"
require_relative "./phase_2.rb"
require_relative "./phase_3.rb"

puts "-----mersenne_prime-----"
def mersenne_prime(num)
    power_two = 2
    i = 0
    while i <= num
        mersenne = power_two - 1
        power_two = power_two * 2
        if prime?(mersenne)
            i += 1
        end
    end
    mersenne
end

def prime?(num)
    if num == 1
        return true
    end
    (2...num).each { |fact| return false if num % fact == 0 }
    return true
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071



puts "-----triangular_word?-----"
def triangular_word?(word)
    tricode = 0
    i = 0
    while tricode < word_code(word)
        i += 1
        tricode = (i * (i + 1)) / 2
    end
    tricode == word_code(word)
end

def word_code(word)
    alphabet = ("a".."z").to_a
    code = 0
    word.each_char { |char| code += alphabet.index(char) + 1 }
    code
end

# puts word_code("question")
p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false



puts "-----consecutive_collapse-----"
def consecutive_collapse(nums)
    idx = 0
    while idx < nums.length
        if nums[idx] + 1 == nums[idx + 1] || nums[idx] - 1 == nums[idx + 1]
            nums.delete_at(idx + 1)
            nums.delete_at(idx)
            idx = 0
        next
        end
        idx += 1
    end
    nums
end

# (nums[idx] != nil && nums[idx + 1] != nil) && 

# def collapse(nums)
#     (0...nums.length - 1).each do |i|
#         if nums[i] + 1 == nums[i + 1] || nums[i] == nums[i + 1] + 1
#             return nums[0...i] + nums[i + 2..-1]
#         end
#     end

#     nums
# end

# def consecutive_collapse(numbers)
#     numbers.each { numbers = collapse(numbers) }
#     numbers
# end

p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []



puts "-----pretentious_primes-----"
def pretentious_primes(nums, n)
    if n > 0
        nums.each_with_index do |num, idx|
            primes = num
            counter = 0
            while counter < n 
                primes += 1
                counter += 1 if prime?(primes)
            end
            nums[idx] = primes
        end
    elsif n < 0
        nums.each_with_index do |num, idx|
            primes = num
            counter = 0
            while counter > n
                primes -= 1
                counter -= 1 if prime?(primes)
            end
            if primes < 2
                nums[idx] = nil
            else
                nums[idx] = primes
            end
        end
    end
    nums
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]