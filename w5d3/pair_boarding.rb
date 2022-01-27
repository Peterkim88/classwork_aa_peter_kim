# def bfs - breath first seach method
# pass a node into the value parameter for the method.
# have it searchable one level in relation to the children.
# have a recursie call to continue search until a child node has met the conditions and 
# if the conditions are not met, return false.

class Node

  def bfs(target)


    self.children.any? { |child| return child if child.value == target }

    self.children.each do |child|
      child.bfs(target)
    end

    

  end

end