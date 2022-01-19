require_relative 'piece'

class King < Piece
    include Stepable
    
    def initialize(color, board, pos)
      super
      @move_dirs = [[0, 1], [1, 0], [0, -1], [-1, 0], [1,1], [-1,-1], [-1,1], [1,-1]]
      @symbol = :king
    end
  
end