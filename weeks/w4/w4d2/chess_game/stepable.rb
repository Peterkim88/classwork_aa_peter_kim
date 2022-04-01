# create array to collect moves
# iterate through each of the piece's possible move_diffs
      # for each move_diff, increment the piece's position to generate a new position
      # add the new position to the moves array if it is:
          # on the board and empty
          # OR on the board and contains a piece of the opposite color
          # < 7 && (pos[0] + move[0]) >= 0
    # return the final array of moves
module Stepable
    
    def moves
        valid_moves = []
        move_diffs.each do |move|
        new_pos = [(pos[0] + move[0]), (pos[1] + move[1])]
        if (0..7).include?(new_pos[0]) && 
            (0..7).include?(new_pos[1]) &&
            (board[new_pos].empty? || board[new_pos].color != color)
            valid_moves << new_pos
        end
        end
        valid_moves  
    end

    private

    def move_diffs
        # subclass implements this
        raise NotImplementedError
    end

end

# Note: you can invoke methods from the piece from within the module methods, and vice versa. It is a two way street!