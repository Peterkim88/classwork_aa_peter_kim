class Board

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, "_") }
    end

    def valid?(pos)
        pos[0] < @grid.length && pos[0] >= 0 && pos[1] < @grid.length && pos[1] >= 0
    end

    def empty?(pos)
        r = pos[0]
        c = pos[1]
        @grid[r][c] == "_"
    end

    def place_mark(pos, mark)
        r = pos[0]
        c = pos[1]
        position = [r, c]
        if self.empty?(position) && self.valid?(position)
            @grid[r][c] = mark
        else
            raise "invalid or filled position"
        end
    end

    def print
        @grid.each { |row| puts row.join(" ") }
    end

    def win_row?(mark)
        @grid.each { |row| return true if row.all? { |el| el == mark } }
        return false
    end

    def win_col?(mark)
        @grid.transpose.each { |col| return true if col.all? { |el| el == mark } }
        return false
    end

    # def win_diagonal?(mark)
    #     l_counter = 0
    #     (0...@grid.length).each { |i| l_counter += 1 if @grid[i][i] == mark }
    #     r_counter = 0
    #     (0...@grid.length).each { |i| r_counter += 1 if @grid.reverse[i][i] == mark }
    #     l_counter == @grid.length || r_counter == @grid.length
    # end

    def win_diagonal?(mark)
        reversed_grid = @grid.reverse
        if (0...@grid.length).all? { |i| @grid[i][i] == mark }
            return true
        elsif (0...@grid.length).all? { |ri| reversed_grid[ri][ri] == mark }
            return true
        else
            return false
        end
    end
            
    #     elsif (0...@grid.length).all? do |i|
    #         @grid.reverse[i][i] == mark
    #         end
    #         return true
    #     else
    #         return false
    #     end
    # end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark) 
    end

    def empty_positions?
        @grid.any? { |row| row.any? { |el| el == "_" } }
    end

    def legal_positions
        legal_pos = []
        (0...@grid.length).each do |r|
            (0...@grid.length).each do |c|
                legal_pos << [r, c]
            end
        end
        legal_pos.select do |pos|
            r = pos[0]
            c = pos[1]
            @grid[r][c] == "_"
        end
    end

end