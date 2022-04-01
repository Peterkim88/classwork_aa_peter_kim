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

class Board

    # CARDS = ("A".."Z").to_a

    attr_reader :board, :play_board
    def initialize(width, length)
        @board = Array.new(length) { Array.new(width, "_") }
        @play_board = Array.new(length) { Array.new(width, "_") }
        @width = width
        @length = length
        @size = width * length
        @cards = Card.new(@size)
    end

    def populate
        cards = @cards.get_cards
        cards.each do |card|
            filled = false
            while filled == false
                r = rand(0...@length)
                c = rand(0...@width)
                if @board[r][c] == "_"
                    @board[r][c] = card
                    filled = true
                end
            end
        end
    end

    def print
        # @board.each { |row| puts row.to_s }
        @play_board.each { |row| puts row.to_s }
    end

    def [](pos)
        r, c = pos
        @play_board[r][c]
    end

    def []=(pos, val)
        @play_board = val
    end

    def show_output(pos1, pos2)
        @play_board[pos1[0]][pos1[1]] = @board[pos1[0]][pos1[1]]
        @play_board[pos2[0]][pos2[1]] = @board[pos2[0]][pos2[1]]
        self.print
        sleep(3)
        p "--------------------"
        p "--------------------"
        p "--------------------"
        p "--------------------"
        p "--------------------"
        p "--------------------"
        if @play_board[pos1[0]][pos1[1]] != @play_board[pos2[0]][pos2[1]]
            @play_board[pos1[0]][pos1[1]] = "_"
            @play_board[pos2[0]][pos2[1]] = "_"
        end
        self.print
    end

    def win?
        self.play_board == self.board
    end


    # def valid_positions?(pos, pos_2)


end