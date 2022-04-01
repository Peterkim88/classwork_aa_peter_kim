## class for game
### initialize method should take args of width and length
### Board.new automatically call Card.new methods
### play_turn with other supporting methods
### play_turn should get input from user for two positions on the board
### if one position is requested, the second position should be requested after the first input has come out
### check if positions are not valid? ("_") raise an error if so
### when the positions are valid, we should change the state of the render board if the two position marks are equal to one of them

require_relative "./card.rb"
require_relative "./board.rb"





#######*** to play game open pry and type "load 'game.rb'" followed by "Game.play_turn" ***######
#######*** works perfectly as long and inputs are in the format of two numbers in the range and 1 space. ***######
#######*** needs more work to fine tune. ***######


#######*** if possible would like to speak to an instructor about the differences between this solution and ***######
#######*** the a/a one to and which is perferred in job settings. ***######


class Game
    def self.play_turn
        p "enter a width and length for board dimensions like '4 5'"
        bdim = gets.chomp.split(" ").map(&:to_i)
        raise "dimensions are invalid, restart the game" if (bdim[0] * bdim[1]) > 26 || (bdim[0] * bdim[1]).odd? 
        game = Board.new(bdim[0], bdim[1])
        game.populate
        game.print
        while !game.win? do
            p "enter a pos like '2 2'"
            pos1 = gets.chomp.split(" ").map(&:to_i)
            p "enter another pos like '1 1'"
            pos2 = gets.chomp.split(" ").map(&:to_i)
            game.show_output(pos1, pos2)
            p "--------------------"
            p "--------------------"
            p "--------------------"
            p "--------------------"
            p "--------------------"
            p "--------------------"
        end
        p "you win!"
    end
end