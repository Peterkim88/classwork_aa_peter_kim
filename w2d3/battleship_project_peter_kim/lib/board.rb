class Board
  
    def self.print_grid(grid)
        grid.each { |row| puts row.join(" ") }
    end

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def size
        @size
    end

    def [](pos)
        r = pos[0]
        c = pos[1]
        @grid[r][c]
    end

    def []=(pos, val)
        r = pos[0]
        c = pos[1]
        @grid[r][c] = val
    end

    def num_ships
        @grid.flatten.count { |el| el == :S }
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            p "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships 
        while self.num_ships < (self.size * 0.25)
            r = rand(0...@grid.length)
            c = rand(0...@grid.length)
            pos = [r, c]
            self[pos] = :S if self[pos] != :S
        end
    end

    def hidden_ships_grid
        @grid.map { |row| row.map { |el| el == :S ? :N : el } }
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
