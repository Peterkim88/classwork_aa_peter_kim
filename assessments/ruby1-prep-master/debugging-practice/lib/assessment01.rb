require "byebug"

class Array
  def my_inject(accumulator = nil, &block)
    # i = 0
# debugger
    value = []
    if accumulator == nil
      # value << self.first
      # value = block.call(self.first, self[])
      (0...self.length - 1).each do |i|
        acc = self[i]
        el = self[i + 1]
        value = block.call(acc, el)
      end
    else
      self.unshift(accumulator)
      (0...self.length - 1).each do |i|
        acc = self[i]
        el = self[i + 1]
        value = block.call(acc, el)
      end
    end
    value
    # if accumulator == nil
    #   accumulator ||= self.first
    #   i += 1
    # end
    
    # while i < self.length
    #   accumulator = block.call(accumulator, i)
    #   i += 1
    # end

    # acumulator
  end
end

def is_prime?(num)
  return true if num == 2
  (2...num).none? { |factor| num % factor == 0 }
end

def primes(count)
  primes = []
# debugger
  i = 2
  while primes.length < count
    primes << i if is_prime?(i)

    i += 1
  end

  primes
end

# The "calls itself recursively" spec may say that there is no method
# named "and_call_original" if you are using an older version of
# rspec. You may ignore this failure.
# Also, be aware that the first factorial number is 0!, which is defined
# to equal 1. So the 2nd factorial is 1!, the 3rd factorial is 2!, etc.
def factorials_rec(num)
  if num == 0
    [1]
  else
    facs = factorials_rec(num)
    facs << facs.last * (num - 1)
    facs
  end
end

class Array
  def dups
    positions = Hash.new { |h, k| [] }

    each_with_index do |item, index|
      positions[item] << index
    end

    positions.select { |key, val| key.count > 1 }
  end
end

class String
  def symmetric_substrings
    symm_subs = []

    length.times do |start_pos|
      (1..(length - start_pos)).each do |len|
        substr = self[start_pos..(start_pos + len)]
        symm_subs << substr if substr == substr.reverse
      end
    end

    symm_subs
  end
end

class Array
  def merge_sort(&prc)
    # See how I create a Proc if no block was given; this eliminates
    # having to later have two branches of logic, one for a block and
    # one for no block.
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    Array.merge(
      self.take(count / 2).merge_sort(&prc),
      self.drop(count / 2).merge_sort(&prc)
    )
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left, right)
      when 1
        merged << left.shift
      when 0
        merged << left.shift
      when -1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end