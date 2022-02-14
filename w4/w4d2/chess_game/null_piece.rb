
class NullPiece < Piece
  include Singleton

  def initialize(color=nil, board=nil, pos=nil)
    super
    @color = nil
    @symbol = :null
  end

end