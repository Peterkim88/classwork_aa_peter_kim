## class for board
### initialize(width, length) create new board with width wide and length long/high
### when we create the new board have each position set as "_"
### populate - two identical instances of Card and replace the values of the board in random positions until the full board is filled
### create a hidden board when we create the new board have each position set as "_"
### render - print out current state of hidden board
### win? - if render is showing that all cards are revealed, return win
### populate method take each from the array of random cards and put into random empty spot on board
### [], []=, getter and setter methods specific for this board

require_relative "./card.rb"


# class Board
#     CARDS = ("A".."Z").to_a

#     def self.random
#         CARDS.sample
#     end

#     def initialize

#     end
# end



class Board

  CARDS = ("A".."Z").to_a

  attr_reader :board, :size, :length, :width

  def initialize(width, length)
    @board = Array.new(length) { Array.new(width) }
    @width = width
    @length = length
    @size = width * length
    raise "board dimensions must be even" if @size.odd? # % 2 != 0
  end

  def populate
    counter = 0
    while counter < self.size
      pair_counter = 0
      card = Card.new(CARDS.sample)
      while pair_counter < 2
        r = rand(0...self.length)
        c = rand(0...self.width)
        if @board[r][c] == nil
          @board[r][c] = card
          pair_counter += 1
          counter += 1
        end
      end
    end
  end

  def render
    @board.map do |row|
      puts
      row.map do |card|
        if card.face_up
          print "#{card.face_value} "
        elsif !card.face_up
          print "_ "
        end
        # print card.face_value
      end
    end
  end

  def [](pos)
    r, c = pos
    @board[r][c]
  end

  def []=(pos, value)
    r, c = pos
    @board[r][c] = value
  end

  def win?
    @board.all? { |row| row.all? { |card_inst| card_inst.face_up == true } }
  end

  def reveal(pos)
    self[pos].reveal
    self[pos].face_value
  end

end