require_relative 'piece'
class Rook < Piece
    include Slideable
  
    attr_reader :symbol
    def initialize(color, board, pos)
      super 
      @move_dirs = [[0, 1], [1, 0], [0, -1], [-1, 0]]
      @symbol = :rook
    end
  
    ♖  ♜
    
  
    
end