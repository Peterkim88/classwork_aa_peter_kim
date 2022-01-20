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
