class Piece
  attr_reader :color, :board, :pos
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    
  end

  def to_s(type)
    "#{@color} #{self.symbol}"  ### MIGHT SCREW UP
  end

  def empty?
    board[pos].symbol == :null
  end

  
end












