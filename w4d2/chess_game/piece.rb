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

  def valid_moves
  end

  def pos=(val)
  end

  def symbol
  end

  private 
  def move_into_check?(end_pos)
  end
end












