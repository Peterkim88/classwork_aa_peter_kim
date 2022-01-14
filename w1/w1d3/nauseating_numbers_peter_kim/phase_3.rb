require "byebug"
require_relative "./phase_1.rb"
require_relative "./phase_2.rb"


puts "-----matrix_addition_reloaded-----"
def matrix_addition_reloaded(*matrices)
    (0...matrices.length)
    matrices.inject do |m1, m2| 
        if (m1.length != m2.length) || m2 == nil
            return nil
        else
            matrix_addition(m1, m2)
        end
    end
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]
matrix_f = [[], []]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c, matrix_f)    # [[10, 6], [7, 6]]


puts "-----squarocol?-----"
def squarocol?(grid)
    return true if grid.any? { |row| row.uniq.length == 1 }
    return true if grid.transpose.any? { |col| col.uniq.length == 1 }
    return false
end

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false



puts "-----squaragonal?-----"
def squaragonal?(grid)
    left_diag = []
    i = 0
    r = 0
    right_diag = []
    ri = -1
    while i < grid.length
        left_diag << grid[r][i]
        right_diag << grid[r][ri]
        i += 1
        r += 1
        ri -= 1
    end

    left_diag.uniq.length == 1 || right_diag.uniq.length == 1

end

p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false



# puts "-----pascals_triangle-----"
# def pascals_triangle(num)
#     base = [[1], [1, 1], [1, 2, 1]]
#     (num - base.length).times do
#         add_base = [] 
#         last = base[-1]
#         add_base << last[0]
#         (0...last.length-1).each do |idx|

#             add_base << last[idx] + last[idx + 1]

#         end
#         add_base << last[-1]
#         base << add_base
#     end
#     base
# end
puts "-----pascals_triangle-----"
def pascals_triangle(num)
    base = [[1]]
    (num - 1).times do
        add_base = [] 
        last = base[-1]
        add_base << last[0]
        (0...last.length-1).each { |idx| add_base << last[idx] + last[idx + 1] }
        add_base << last[-1]
        base << add_base
    end
    base
end

p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]