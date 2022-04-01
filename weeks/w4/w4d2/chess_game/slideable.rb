class Slideable

    @@HORIZONTAL_DIRS = [[0, 1], [1, 0], [0, -1], [-1, 0]].freeze
    @@DIAGONAL_DIRS = [[1,1], [-1,-1], [-1,1], [1,-1]].freeze

    def horizontal_dirs
        @@HORIZONTAL_DIRS
    end

    def diagonal_dirs
        @@DIAGONAL_DIRS
    end

    def moves
        all_valid_moves = []
        move_dirs.each do |pos|
            dx, dy = pos
            all_valid_moves += grow_unblocked_moves_in_dir(dx, dy)
        end
        all_valid_moves
    end

    private
    def grow_unblocked_moves_in_dir(dx, dy)
        new_pos = [dx+pos[0],dy+pos[1]]
        possible_moves = [new_pos]
        while (0...7).include?(new_pos[0]) &&
            (0...7).include?(new_pos[1]) &&
            board[new_pos].empty?
            new_pos = [new_pos[0] + dx, new_pos[1] + dy]
            possible_moves < new_pos
        end
        possible_moves
    end
end