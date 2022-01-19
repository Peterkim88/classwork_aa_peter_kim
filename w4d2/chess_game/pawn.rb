require_relative 'piece'

class Pawn < Piece
    
    attr_reader :symbol
    def initialize(color, board, pos)
      super
      if color == white
        if pos[0] == 6
          @move_dirs = [[0, -1], [0, -2]]
        else
          @move_dirs = [[0, -1]] 
        end
      else
        if pos[0] == 1
          @move_dirs = [[0, 1], [0, 2]]
        else
          @move_dirs = [[0, 1]]
        end
      end
      @symbol = :pawn
    end
    

    ♙  ♟
  
  
  end