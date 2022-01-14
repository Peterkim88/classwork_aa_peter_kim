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

    def get_position(positions)
        puts "Player #{mark.to_s}, enter a position like '1 2' to place mark"
        pos = gets.chomp.split(" ").map(&:to_i)
        pos
            if !positions.include?(pos)
                puts 'position is already filled or not valid'
                self.get_position(positions)
                # raise 'position is already filled or not valid'
            end
    end

end