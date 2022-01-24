class MaxIntSet

  attr_reader :store

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if is_valid?(num) && !include?(num)
      @store[num] = true
    end
  end

  def remove(num)
    if is_valid?(num) && include?(num)
      @store[num] = false
    end
  end

  def include?(num)
    return @store[num]
  end

  private

  def is_valid?(num)
    if num > @store.length
      raise "Out of bounds"
    elsif num < 0
      raise "Out of bounds"
    end
    return true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num
  end

  def remove(num)
    # @store[num % num_buckets].delete(num) if include?(num)
    if include?(num)
      i = 0
      while i < @store[num % num_buckets].length
        if num == @store[num % num_buckets][i]
          @store[num % num_buckets].delete_at(i)
        end
        i += 1
      end
    end
  end

  def include?(num)
    if @store[num % num_buckets].include?(num)
      return true
    else
      return false
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
