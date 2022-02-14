require_relative 'piece'
class Queen < Piece
    include Slideable
    
    attr_reader :symbol
    def initialize(color, board, pos)
      super
      if color == black 
        @symbol = ♛
      else
        @symbol = ♕
      end
    end

    private
    def move_dirs
        horizontal_dirs + diagonal_dirs
    end
    
end