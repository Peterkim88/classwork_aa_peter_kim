require "./board.rb"
require "./human_player.rb"
require "byebug"

class Game

    def initialize(n, *marks)
        @board = Board.new(n)
        @players = marks.map { |mark| HumanPlayer.new(mark) }
        @current_player = @players.first
    end

    def switch_turn
        @players.rotate!
        @current_player = @players.first
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            until @board.empty?(pos) && @board.valid?(pos)
                p "invalid position or position already taken"
                pos = @current_player.get_position
            end
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                @board.print
                p "Player #{@current_player.mark} wins!"
                return true
            else
                self.switch_turn
            end
        end
    end

end