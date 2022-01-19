require_relative 'piece'
class Queen < Piece
    include Slideable
    
    def initialize(color, board, pos)
      super
      @move_dirs = [[0, 1], [1, 0], [0, -1], [-1, 0], [1,1], [-1,-1], [-1,1], [1,-1]]
      @symbol = :queen
    end
  
end