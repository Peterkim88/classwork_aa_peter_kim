require_relative "./board.rb"
require_relative "./computer_player.rb"
require_relative "./human_player.rb"

class Game

    def initialize(n, marks)
        @players = marks.map { |mark, bool| bool ? ComputerPlayer.new(mark) : HumanPlayer.new(mark) }
        @current_player = @players.first
        @board = Board.new(n)
    end

    def switch_turn
        @current_player = @players.rotate!.first
    end

    def play
        while @board.empty_positions?
            @board.print
            positions = @board.legal_positions
            pos = @current_player.get_position(positions)
            mark = @current_player.mark
            @board.place_mark(pos, mark)
            if @board.win?(mark)
                puts "Game Over"
                puts "#{@current_player.upcase} HAS WON!"
                return
            else
                switch_turn
            end
        end
        puts "draw"
    end

end