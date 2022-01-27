class Stack

  def initialize
    @underlying_array = []
  end

  def size
    @underlying_array.length
  end

  def empty?
    @underlying_array.length == 0
  end

  def top
    @underlying_array[-1]
  end

  def peek(n)
    top_items = []
    i = @underlying_array.length - 1
    counter = 0
    while counter < n
      top_items << @underlying_array[i]
      i -= 1
      counter += 1
    end
    top_items
  end

  def push(item)
    @underlying_array << item
    @underlying_array.length
  end

  def pop
    return nil if @underlying_array.empty?
    last = @underlying_array[-1]
    @underlying_array = @underlying_array[0...-1]
    last
    # @underlying_array.pop
  end

  private

  attr_accessor :underlying_array

end