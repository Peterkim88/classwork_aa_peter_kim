require_relative 'piece'
class Rook < Piece
    include Slideable
  
    attr_reader :symbol
    def initialize(color, board, pos)
      super 
      @move_dirs = [[0, 1], [1, 0], [0, -1], [-1, 0]]
      @symbol = ♖  if color == white
      @symbol =  ♜ if color == black

    end
  
     
    private
    def move_dirs
        horizontal_dirs
    end
  
    
end