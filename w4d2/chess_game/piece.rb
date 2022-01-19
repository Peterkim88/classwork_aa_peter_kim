class Piece

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end
  
end

class Rook < Piece
  include Slideable

  def initialize(color, board, pos)
    super 
    @move_dirs = [[0, 1], [1, 0], [0, -1], [-1, 0]]
  end

end

class Bishop < Piece
  include Slideable
  
  def initialize(color, board, pos)
    super
    @move_dirs = [[1,1], [-1,-1], [-1,1], [1,-1]]
  end

end

class Queen < Piece
  include Slideable
  
  def initialize(color, board, pos)
    super
    @move_dirs = [[0, 1], [1, 0], [0, -1], [-1, 0], [1,1], [-1,-1], [-1,1], [1,-1]]
  end

end

class Knight < Piece
  include Stepable
  
  def initialize(color, board, pos)
    super
    @move_dirs = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]] 
  end

end

class King < Piece
  include Stepable
  
  def initialize(color, board, pos)
    super
    @move_dirs = [[0, 1], [1, 0], [0, -1], [-1, 0], [1,1], [-1,-1], [-1,1], [1,-1]]
  end

end

class Pawn < Piece
  include Stepable
  
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
  end

end

class NullPiece < Piece
  include Singleton

  def initialize(color=nil, board=nil, pos=nil)
    super
    @color = nil
    @type = nil
  end

end