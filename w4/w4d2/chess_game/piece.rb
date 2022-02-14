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
    (0..7).include?(new_pos[0]) && 
      (0..7).include?(new_pos[1]) &&
      board[new_pos].color != color
  end

  def pos=(val)
    @pos = val
  end


  private 
  def move_into_check?(end_pos)
    opponent_pieces = @board.select {|rows| rows.select {|piece| piece.color != color && piece.color != :null}
  end

  def in_check?
  end
end












