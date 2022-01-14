require "byebug"

p "-----multiply-----"
def multiply(a, b)
    if b == 0 || a == 0
        return 0
    end
    if b > 0
        a + multiply(a, b - 1)
    else b < 0
        -(a + multiply(a, (-b) - 1))
    end
end

p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18



p "-----lucas_sequence-----"
def lucas_sequence(n)
    return [] if n == 0
    return [2] if n == 1
    return [2, 1] if n == 2
    seq = lucas_sequence(n - 1)
    seq << seq[-1] + seq[-2]
    seq
end

p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]