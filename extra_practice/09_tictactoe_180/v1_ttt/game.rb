require "./board.rb"
require "./human_player.rb"
require "byebug"

class Game

    def initialize(player_1_mark, player_2_mark)
        @board = Board.new
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @current_player = @player_1
    end

    def switch_turn
        return @current_player = @player_2 if @current_player == @player_1
        @current_player = @player_1
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            # debugger
            if @board.win?(@current_player.mark)
                "Player #{@current_player.mark} wins!"
                return true
            else
                self.switch_turn
            end
        end
    end

end