class Array
  # Write a new `Array#merge_sort` method; it should not modify the
  # array it is called on, but create a new sorted array.
  # **Do NOT use the built-in `Array#sort` or `Array#sort_by` methods in your
  # implementation.**

  def merge_sort(&prc)
    return self if self.length <= 1
    mid = self.length / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)
    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    prc ||= Proc.new { |a, b| a <=> b }
    sorted = []
    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == 1
        sorted << right.shift
      else
        sorted << left.shift
      end
    end
    sorted.concat(left)
    sorted.concat(right)
    sorted
  end
end

class Array
  # Write a new `Array#pair_sum(target)` method that finds all pairs of
  # positions where the elements at those positions sum to the target.

  # NB: ordering matters. I want each of the pairs to be sorted
  # smaller index before bigger index. I want the array of pairs to be
  # sorted "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def pair_sum(target)
    pairs = []
    (0...self.length-1).each do |idx1|
      (idx1+1...self.length).each do |idx2|
        pairs << [idx1, idx2] if self[idx1] + self[idx2] == target
      end
    end
    pairs
  end
end

class Array
  # Write a method that flattens an array to the specified level. If no level
  # is specified, it should entirely flatten nested arrays.

  # **Do NOT use the built-in `Array#flatten` method in your implementation.**

  # Examples:
  # Without an argument:
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten = ["a", "b", "c", "d", "e"]

  # When given 1 as an argument:
  # (Flattens the first level of nested arrays but no deeper)
  # [["a"], "b", ["c", "d", ["e"]]].my_flatten(1) = ["a", "b", "c", "d", ["e"]]

  def my_flatten(level = nil)
    flat = []
    arr = self.dup
    arr.each do |el|
      if el.is_a?(Array) && level != 0
        if level.nil?
          flat += el.my_flatten
        else
          flat += el.my_flatten(level - 1)
        end
      else
        flat << el
      end
    end
    flat
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns all
  # substrings which are equal to their reverse image ("abba" ==
  # "abba"). We should only include substrings of length > 1.

  def symmetric_substrings
    syms = []
    (0...self.length).each do |idx1|
      (0...self.length).each do |idx2|
        subs = self[idx1..idx2]
        syms << subs if subs == subs.reverse && subs.length > 1
      end
    end
    syms
  end
end


# Write a method `nth_prime` that returns the nth prime number. You may wish to
# use an `is_prime?` helper method.

def nth_prime(n)
  return nil if n == 0
  i = 0
  num = 0
  while i < n
    num += 1
    i += 1 if is_prime?(num)
  end
  num
end

def is_prime?(num)
  return false if num < 2
  (2...num).each { |n| return false if num % n == 0 }
  return true
end

class Array
  # Write an `Array#my_each` method that calls a passed block for each element
  # of the array. 
  # **Do NOT use the built-in `Array#each`, `Array#each_with_index` or 
  # `Array#map` methods in your implementation.**

  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end
    self
  end
end

class Array
  # Write an `Array#my_select` method that returns an array made up of the
  # elements in the array that return `true` from the given block.
  # **Do NOT use the built-in `Array#select` or `Array#reject` methods in your
  # implementation.**

  def my_select(&prc)
    selected = []
    self.each { |el| selected << el if prc.call(el) }
    selected
  end
end

