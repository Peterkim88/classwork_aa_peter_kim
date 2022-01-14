class Board

    attr_reader :grid

    def initialize
        @grid = Array.new(3) { Array.new(3, "_") }
    end

    def [](pos)
        r, c = pos
        @grid[r][c]
    end

    def []=(pos, val)
        r, c = pos
        @grid[r][c] = val
    end

    def valid?(pos)
        r, c = pos
        (0...@grid.length).include?(r) && (0...@grid.length).include?(c)
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def place_mark(pos, mark)
        if !valid?(pos) || !empty?(pos)
            raise 'invalid mark'
        end
        self[pos] = mark
    end

    def print
        @grid.each { |row| puts row.join(" ") }
    end

    def win_row?(mark)
        @grid.each { |row| return true if row.uniq == mark }
        return false
    end

    def win_col?(mark)
        @grid.transpose.each { |col| return true if col.uniq == mark }
        return false
    end 

    def win_diagonal?(mark)
        win_left_diag?(mark) || win_right_diag?(mark)
    end

    def win_left_diag?(mark)
        (0...@grid.length).all? { |i| @grid[i][i] == mark }
    end

    def win_right_diag?(mark)
        (0...@grid.length).all? do |i|
            c = (i * -1) - 1
            @grid[i][c] == mark
        end
    end

    def win?(mark)
        (win_row?(mark) || win_col?(mark)) || win_diagonal?(mark)
    end

    def empty_positions?
        i = (0...@grid.length).to_a
        positions = i.product(i)
        positions.any? { |pos| empty?(pos) }
    end

end