require_relative "./piece.rb"
require_relative "./null_piece.rb"

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8)}
    self.add_pieces
  end

  def make_royals(color)

  def add_pieces
    make_royals(:white)
    make_royals(:black)
    royals_white = [Rook.new,
                    Knight.new, 
                    Bishop.new, 
                    Queen.new, 
                    King.new, 
                    Bishop.new, 
                    Knight.new, 
                    Rook.new]
                  
    royals_black = [Rook.new, 
                    Knight.new, 
                    Bishop.new, 
                    Queen.new, 
                    King.new, 
                    Bishop.new, 
                    Knight.new, 
                    Rook.new]
                  
    (0...@grid.length).each do |idx|
      if idx == 0
        @grid[idx] = royals_white
      elsif idx == 7 
        @grid[idx] = royals_black
      elsif idx == 1 || idx == 6
        @grid[idx].map!.with_index { |pos, i| pos = Pawn.new([idx,i]) }
      else
        @grid[idx].map!.with_index { |pos, i| pos = NullPiece.instance }
      end
    end
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end
  
  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def move_piece(start_pos, end_pos)
    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end

end