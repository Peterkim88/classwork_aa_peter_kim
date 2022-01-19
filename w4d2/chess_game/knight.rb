require_relative 'piece'

class Knight < Piece
    include Stepable
    
    def initialize(color, board, pos)
      super
      @move_dirs = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]] 
      @symbol = :knight
    end
  
end