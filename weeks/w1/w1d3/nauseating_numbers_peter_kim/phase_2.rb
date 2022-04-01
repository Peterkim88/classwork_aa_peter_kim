require "byebug"
require_relative "./phase_1.rb"

puts "-----anti_prime?-----"
def anti_prime?(num)
    (1...num).each do |n|
        if divisor_count(n) > divisor_count(num)
            return false
        end
    end
    return true
end

def divisor_count(num)
    count = 0
    (1..num).each { |n| count += 1 if num % n == 0 }
    count
end

p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false



puts "-----matrix_addition-----"
def matrix_addition(matrix_1, matrix_2)
    new_matrix = []
    matrix_1.each_with_index do |sub_m, idx1|
        (0...matrix_1.length-1).each do |i| 
            if sub_m.length != matrix_1[i+1].length
                return nil
            end
        end
        sub_matrix = []
        (0...sub_m.length).each do |idx2|
            sub_matrix << matrix_1[idx1][idx2] + matrix_2[idx1][idx2]
        end
        new_matrix << sub_matrix
    end
    new_matrix
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]



puts "-----mutual_factors-----"
def mutual_factors(*numbers)
    nums = numbers.map
    mutual = []
    i = 1
    while i <= nums.min
        if nums.all? { |num| num % i == 0 }
            mutual << i
        end
        i += 1
    end
    mutual
end

p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]



puts "-----tribonacci_number-----"
def tribonacci_number(nth)
    trib_nums = [1, 1, 2]

    (4..nth).each do |n|
        trib_nums << trib_nums[n-2] + trib_nums[n-3] + trib_nums[n-4]
    end

    return trib_nums[nth - 1]

end

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274