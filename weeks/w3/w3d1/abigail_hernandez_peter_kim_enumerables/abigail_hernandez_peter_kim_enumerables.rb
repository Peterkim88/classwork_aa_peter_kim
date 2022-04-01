
p "-----my_each-----"
class Array

  def my_each(&prc)
      i = 0
      while i < self.length
          prc.call(self[i])
          i += 1
      end
      self
  end

  def my_select(&prc)

      ret = []
      self.my_each do |el|
          ret << el if prc.call(el)
      end

      ret

  end

  def my_reject(&prc)
    ret = []
    self.my_each do |el|
      ret << el if !prc.call(el)
    end
    ret
  end

  def my_any?(&prc)
    self.my_each { |el| return true if prc.call(el) }
    return false
  end

  def my_all?(&prc)
    self.my_each { |el| return false if !prc.call(el) }
    return true
  end

  def my_flatten
    ret = []
    self.my_each do |arr|
      if arr.is_a? Array
          ret += arr.my_flatten
      else
          ret << arr
      end
    end
    ret
  end


  def my_zip(*args)
    zipped = []

    self.each do |el| # [[1],[2],[3]] 
      zipped << [el]
    end

    args.each do |arg|
      (0...self.length).each do |i|
        if arg[i].nil?
          zipped[i] << nil
        else
          zipped[i] << arg[i]
        end
      end
    end

    zipped
  end

  def my_zip(*args)
    l = 1 + args.length
    zipped = Array.new(self.length){ Array.new(l) }
    self.each_with_index { |el, si| zipped[si][0] = el }
    args.each_with_index do |arg, ai| 
      (0...self.length).each do |i|
          zipped[i][ai + 1] = arg[i]
      end
    end
    zipped
  end

  def my_rotate(num = 1)
    i = 0
    arr = self.dup
    if num > 0
      while i < num
        first = arr.shift
        arr.push(first)
        i += 1
      end
    else
      while i > num
        last = arr.pop
        arr.unshift(last) 
        i -= 1
      end
    end
    arr
  end

  def my_join(spacer = nil)
    str = ""
    if spacer == nil
      self.each { |char| str += char }
    else
      (0...self.length-1).each { |i| str += "#{self[i]}#{spacer}" }
      str += self[-1]
    end
    str
  end

  def my_reverse
    new_arr = []
    i = self.length - 1
    while i >= 0
      new_arr << self[i]
      i -= 1
    end
    new_arr
  end


  ## working on another appraoch
  # def my_zip(*args)
  #   size = self.length
  #   zip = Array.new(size) { Array.new(size) }
  #   zip_base = [self]
  #   args.each do |arg|
  #     zip_base << arg
  #   end
  #   (0...size).each do |j|
  #       zip_base.each_with_index do |base, i|
  #       zip[j][i] = el
  #     end
  #   end
  #   zip
  # end

end

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"] # rotating(1) 
# p a.my_rotate(-5)     #=> ["b", "c", "d", "a"] ["d", "a", "b", "c"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# return_value = [1, 2, 3].my_each do |num|
#     puts num
#   end.my_each do |num|
#     puts num
#   end
#   # => 1
#        2
#        3
#        1
#        2
#        3
  
#   p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]