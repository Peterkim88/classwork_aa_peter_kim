require_relative 'piece'

class Knight < Piece
    include Stepable
    
    attr_reader :symbol
    def initialize(color, board, pos)
      super
      @move_dirs = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]] 
      @symbol = ♘ if color == white
      @symbol =  ♞ if color == black      
    end

 
     
  
end