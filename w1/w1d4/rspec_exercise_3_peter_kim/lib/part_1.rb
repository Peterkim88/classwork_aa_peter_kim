def is_prime?(num)
    if num < 2
        return false
    end
    (2...num).each { |n| return false if num % n == 0 }
    return true
end

def nth_prime(num)
    count = 0
    number = 0
    while count < num
        number += 1
        if is_prime?(number)
            count += 1
        end
    end
    number
end

def prime_range(min, max)
    number = min
    range_primes = []
    while number <= max
        if is_prime?(number)
            range_primes << number
        end
        number += 1
    end
    range_primes
end