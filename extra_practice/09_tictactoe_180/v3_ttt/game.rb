require "./board.rb"
require "./human_player.rb"
require "byebug"
require "./computer_player.rb"

class Game

    def initialize(n, marks)
        @board = Board.new(n)
        @players = []
        marks.each do |mark, val| 
            if val
                @players << ComputerPlayer.new(mark)
            else
                @players << HumanPlayer.new(mark)
            end
        end
        @current_player = @players.first
    end

    def switch_turn
        @players.rotate!
        @current_player = @players.first
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position(@board.legal_positions)
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
        p "game has ended in a draw"
    end

end