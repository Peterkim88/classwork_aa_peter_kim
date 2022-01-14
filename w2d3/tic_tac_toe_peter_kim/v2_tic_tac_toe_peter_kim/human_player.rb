require_relative "./board.rb"

class HumanPlayer

    def initialize(mark)
        # puts "enter ':X' or ':O' to set your mark"
        # mark = gets.chomp
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position
        puts "Player #{mark.to_s}, enter a position like '1 2' to place mark"
        pos = gets.chomp.split(" ").map(&:to_i)
            raise 'position is already filled or not valid' if pos.length != 2
        pos
    end

end