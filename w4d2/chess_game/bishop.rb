require_relative 'piece'
class Bishop < Piece
    include Slideable
    
    attr_reader :symbol

    def initialize(color, board, pos)
      super
      @move_dirs = 
      @symbol = ♗ if color == black
      @symbol = ♝ if color == white
    end

     
    private
    def move_dirs
        diagonal_dirs
    end
  
end