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

def stock_picker(prices)
  profitable_pair = []
  profit = 0
  (0...prices.length-1).each do |idx1|
    (idx1 + 1...prices.length).each do |idx2|
      if prices[idx2] - prices[idx1] > profit
        profit = prices[idx2] - prices[idx1]
        profitable_pair = [idx1, idx2]
      end
    end
  end
  profitable_pair
end



