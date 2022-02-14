require_relative 'piece'

class King < Piece
    include Stepable
    
    attr_reader :symbol
    def initialize(color, board, pos)
      super
      @move_dirs = [[0, 1], [1, 0], [0, -1], [-1, 0], [1,1], [-1,-1], [-1,1], [1,-1]]
      @symbol = ♚ if color == :black
      @symbol = ♔ if color == :white
    end
  
    private
    def move_diffs
      @move_diffs
    end
  
end