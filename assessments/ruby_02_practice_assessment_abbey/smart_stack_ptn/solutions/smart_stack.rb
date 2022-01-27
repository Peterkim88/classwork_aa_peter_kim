require_relative "stack"

class SmartStack < Stack
  attr_reader :max_size

  def initialize(max_size)
    @max_size = max_size
    super()
  end

  def full?
    self.size == self.max_size
  end

  def push(*items)
    raise 'stack is full' if (items.length + self.size) > self.max_size
    
    items.each { |item| super(item) }
    self.size
  end

  def pop(n = 1)
    popped = []
    n.times do
      popped << super()
    end
    popped
  end

end

# round one passed at 15:19:80


def dfs(target)
  return self if self.value == target

  self.children.each do |child|
    result = child.dfs(target)
    return result unless result.nil?
  end
  nil
end

def bfs(target)
  queue = [self]

  until queue.empty?
    node = queue.shift
    return node if node.value == target
    node.children.each { |child| queue << child }
  end
  nil
end