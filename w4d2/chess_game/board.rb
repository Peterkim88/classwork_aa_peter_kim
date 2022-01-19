require_relative "./piece.rb"

class Board

  attr_accessor :grid

  # def self.add_pieces
  #   royals = [Piece.new(:rook), Piece.new(:knight), Piece.new(:bishop), Piece.new(:queen), 
  #             Piece.new(:king), Piece.new(:bishop), Piece.new(:knight), Piece.new(:rook)]
  #   (0...grid.length).each do |idx|
  #     if idx == 0 || idx == 7 
  #       grid[idx] = royals.dup
  #     elsif idx == 1 || idx == 6
  #       grid[idx].map! { |pos| pos = Piece.new(:pawn) }
  #     else
  #       grid[idx].map! { |pos| pos = Piece.new(:null) }
  #     end
  #   end
  # end

  def initialize
    @grid = Array.new(8) { Array.new(8)}
    self.add_pieces
  end

  def add_pieces
    royals = [Piece.new(:rook), Piece.new(:knight), Piece.new(:bishop), Piece.new(:queen), 
              Piece.new(:king), Piece.new(:bishop), Piece.new(:knight), Piece.new(:rook)]
    (0...@grid.length).each do |idx|
      if idx == 0 || idx == 7 
        @grid[idx] = royals.dup
      elsif idx == 1 || idx == 6
        @grid[idx].map! { |pos| pos = Piece.new(:pawn) }
      else
        @grid[idx].map! { |pos| pos = Piece.new(:null) }
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