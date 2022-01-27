module Searchable
  def dfs(target)
    return self if self.value == target

    self.children.each do |child|
      node = child.dfs(target)
      return node unless node.nil?
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
end


## do not edit if you only want to test DFS and BFS
## specs are commented out for PolyTreeNode

class PolyTreeNode
  include Searchable
  attr_reader :value, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(node)
    # removes child node
    self.parent.children.delete(self) if self.parent != nil
    # assign parent, add to children array
    @parent = node
    node.children << self unless node.nil?
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    raise "Tried to remove node that isn't a child" if child.parent.nil?
    child.parent = nil
  end
end

