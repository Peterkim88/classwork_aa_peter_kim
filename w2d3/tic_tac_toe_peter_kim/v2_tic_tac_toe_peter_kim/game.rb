require_relative "./board.rb"
require_relative "./human_player.rb"

class Game

    def initialize(n, *marks)
        @players = marks.map { |mark| HumanPlayer.new(mark) }
        @current_player = @players.first
        @board = Board.new(n)
    end

    def switch_turn
        @current_player = @players.rotate!.first
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            mark = @current_player.mark
            @board.place_mark(pos, mark)
            if @board.win?(mark)
                puts "#{@current_player} victory!"
                return
            else
                switch_turn
            end
        end
        puts "draw"
    end

end