module Searchable
  def dfs(target)
    return self if self.value == target

    self.children.each do |child|
      node = child.dfs(target)
      return node unless node.nil?
    end

    nil
  end
  # def dfs(target = nil, &prc)
  #   # raise "Need a proc or target" if [target, prc].none?
  #   prc ||= Proc.new { |node| node.value == target }

  #   return self if prc.call(self)

  #   children.each do |child|
  #     result = child.dfs(&prc)
  #     return result unless result.nil?
  #   end

  #   nil
  # end

  def bfs(target)
    queue = [self]

    until queue.empty?
      node = queue.shift
      return node if node.value == target
      node.children.each { |child| queue << child }
    end
    nil
  end

  # def bfs(target = nil, &prc)
  #   raise "Need a proc or target" if [target, prc].none?
  #   prc ||= Proc.new { |node| node.value == target }

  #   nodes = [self]
  #   until nodes.empty?
  #     node = nodes.shift

  #     return node if prc.call(node)
  #     nodes.concat(node.children)
  #   end

  #   nil
  # end
end

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

