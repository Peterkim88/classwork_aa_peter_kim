class DynamicDeque < Deque
require "byebug"
  attr_reader :max_volume

  def initialize(n)
    @concealed_array = []
    @max_volume = n
  end

  def middle
    return @concealed_array if @concealed_array.empty?
    mid = @concealed_array.length / 2
    even_arr = []
    if @concealed_array.size.odd?
      return [@concealed_array[mid]]
    else
      return [@concealed_array[mid-1], @concealed_array[mid]]
    end
  end

  def push_back(*n)
    raise 'deque is full' if @concealed_array.length + n.length > self.max_volume
    n.each { |el| @concealed_array.push(el) }
    @concealed_array.size
  end

  def pop_front(n=1)
    removed = []
    n.times do
      removed << @concealed_array.shift
    end
    removed
  end
  
  private
  
  attr_accessor :concealed_array
  
end