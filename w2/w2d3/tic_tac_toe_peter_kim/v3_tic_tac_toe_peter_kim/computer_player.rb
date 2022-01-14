require_relative "./board.rb"

class ComputerPlayer

    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position(positions)
        pos = positions.sample
        puts "Player #{self.mark.to_s}, chose position #{pos}"
        pos
    end

end