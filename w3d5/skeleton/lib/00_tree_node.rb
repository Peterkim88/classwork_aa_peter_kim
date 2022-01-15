require "byebug"

class PolyTreeNode

  attr_reader :value
  attr_accessor :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  # var a = Node.new("a")
  # var b = Node.new("b")
  # a = <Node> @value == "a", @parent == <Node> @value == "b", @parent == nil, @children == [<Node> @value == "a", @parent == b, @children == []], @children == []
  # b = <Node> @value == "b", @parent == nil, @children == [<Node> @value == "a", @parent == b, @children == []]
  # a.parent = b

  def parent=(new_node) #b
    if @parent != new_node
      @parent.children.delete(self) if @parent != nil      
      @parent = new_node
      if new_node != nil
        new_node.children.push(self)
      end
    end
  end
  
  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    raise "not a child" if child.parent != self
    child.parent = nil
  end 

  def dfs(val)
    # debugger
    return self if self.value == val
    self.children.each do |child| 
      child_value = child.dfs(val)
      return child_value if child_value != nil #!child_value.nil?
    end
    nil
  end

  # def bfs(val)
  #   while self.value != val
  #   return self if self.value == val
  #   self.children.each do |child|
  #     return child if child.value == val
  #   end
  #   bfs(child)
  # end

end

# class Searchable

#   def dfs(nodes, value)
#     mid_idx = nodes / 2
#     return nodes if nodes[mid_idx].value == value
#     left = nodes[0...mid_idx]
#     right = nodes[mid_idx..-1]
#     rec_left = dfs(left, value)
#     rec_right = dfs(right, value)
    
#     # return nodes[mid_idx] if nodes[mid_idx].value == value
#   end
  
# end