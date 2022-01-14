class Board


    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end

    def initialize(size)
        @size = size
        @grid = Array.new(@size) { Array.new(@size) }
    end

    def size
        @size
    end

    def [](pos)
        r, c = pos
        @grid[r][c]
    end

    def []=(pos, mark)
        r, c = pos
        @grid[r][c] = mark
    end

    def complete_row?(mark)
        @grid.any? { |row| row.all? { |pos| pos == mark } }
    end

    def complete_col?(mark)
        (0...@grid.length).any? { |i| @grid.all? { |row| row[i] == mark } }
    end

    def complete_diag?(mark)
        return true if (0...@grid.length).all? { |i| @grid[i][i] == mark }
        return true if (0...@grid.length).all? { |i| @grid.reverse[i][i] == mark }
        return false
    end

    def winner?(mark)
        complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
    end


end
