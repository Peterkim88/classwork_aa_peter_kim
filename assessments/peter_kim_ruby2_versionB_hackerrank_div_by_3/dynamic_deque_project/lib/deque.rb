class Deque

  def initialize
    @concealed_array = []
  end

  def size
    @concealed_array.length
  end

  def blank?
    @concealed_array.empty?
  end

  def front
    @concealed_array.first
  end

  def back
    @concealed_array.last
  end

  def push_back(item)
    @concealed_array.push(item)
    size
  end

  def push_front(item)
    @concealed_array.unshift(item)
    size
  end

  def pop_back
    return nil if blank?
    @concealed_array.pop
  end

  def pop_front
    return nil if blank?
    @concealed_array.shift
  end
  
  private

  attr_accessor :concealed_array
  
end