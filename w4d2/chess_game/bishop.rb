require_relative 'piece'
class Bishop < Piece
    include Slideable
    
    def initialize(color, board, pos)
      super
      @move_dirs = [[1,1], [-1,-1], [-1,1], [1,-1]]
      @symbol = :bishop
    end
  
end