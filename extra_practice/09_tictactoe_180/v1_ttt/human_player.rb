require "./board.rb"

class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        p "Player #{self.mark}, enter a valid row and col position like '1 2'"
        resp = gets.chomp.split(" ").map(&:to_i)
            until resp.length == 2 #&& resp.all? { |i| i == i.to_i }
                p "invalid position, enter a valid row and col position like '1 2'"
                resp = gets.chomp.split(" ").map(&:to_i)
            end
        resp
    end

end