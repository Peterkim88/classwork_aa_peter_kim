class Stack
  def initialize
    @underlying_array = []
  end

  def size
    @underlying_array.length
  end

  def empty?
    self.size == 0
  end

  def top
    @underlying_array.last
  end

  def peek(n)
    @underlying_array[-n..-1]
  end

  def push(item)
    @underlying_array << item
    self.size
  end

  def pop
    return nil if self.empty?
    @underlying_array.pop
  end

end