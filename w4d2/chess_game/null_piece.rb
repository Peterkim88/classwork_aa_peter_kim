require "singleton"

class NullPiece
  include Singleton

  def initialize
    @color = nil
    @type = nil
  end

end