require "byebug"

class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    # accumulator = self.first if accumulator == nil

    # ret_value = []
    # i = 0
    # while i < self.length && accumulator != nil
    #   if i == 0
    #     ret_value = prc.call(accumulator, self[i])
    #   else
    #     ret_value = prc.call(ret_value[0], self[i])
    #   end
    #   i += 1
    # end

    # nili = 1
    # while nili <= self.length - 1 && accumulator == self.first
    #   accumulator = self.first
    #   if nili == 1
    #     ret_value = prc.call(accumulator, self[nili])
    #   else
    #     ret_value = prc.call(ret_value[0], self[nili])
    #   end
    #   nili += 1
    # end

    # ret_value
      
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num < 2
  return true if num == 2
  return true if (2...num).all? { |f| num % f != 0 }
end

def primes(num)
  i = 0
  n = 0
  primes = []
  while i < num
    if is_prime?(n)
      primes << n 
      i += 1
    end
    n += 1
  end
  primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
  end
end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
  end

  private
  def self.merge(left, right, &prc)
  end
end
