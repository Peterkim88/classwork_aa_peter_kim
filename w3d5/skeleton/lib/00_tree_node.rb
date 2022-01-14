class PolyTreeNode

  attr_writer :new_node

  def initialize(new_node)
    @new_node = new_node
    @parent = nil
    @children = []
  end
  
  

end