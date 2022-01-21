class Array

  def my_uniq
    new_arr = self.uniq
  end

end

class Array

  def two_sum
    pairs = []
    (0...self.length-1).each do |idx1|
      (idx1 + 1...self.length).each do |idx2|
        pairs << [idx1, idx2] if self[idx1] + self[idx2] == 0
      end
    end
    pairs
  end

end

# my_transpose([[0, 1, 2], [3, 4, 5], [6, 7, 8]])
#     [0, 1, 2],
#     [3, 4, 5],
#     [6, 7, 8]
#   ])
 # => [[0, 3, 6],
 #    [1, 4, 7],
 #    [2, 5, 8]]

class Array

  def my_transpose

    new_arr = []

    (0...self.length).each do |idx|
      subs = []
      self.each do |sub_arr|
        subs << sub_arr[idx]
      end
      new_arr << subs
    end

    new_arr

  end
  
end





price = [6, 3, 6, 8, 3, 5, 8, 4, 1, 4, 7, 7, 10, 4, 10, 5, 10, 6, 7, 9, 3, 9, 1, 2, 2, 9, 5, 8, 2, 1]