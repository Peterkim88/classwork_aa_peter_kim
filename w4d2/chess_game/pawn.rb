require_relative 'piece'

class Pawn < Piece
    
    attr_reader :symbol
    def initialize(color, board, pos)
      super
      @symbol = ♙ if color == :white
      @symbol = ♟ if color == :black
    end

    def at_start_row?
        pos[0] == 6 || pos[0] == 1
    end

    def forward_dir
        color == :black ? 1 : -1
    end

    def forward_steps
        if at_start_row?
            [[forward_dir, 0], [forward_dir*2, 0]]
        else
            [forward_dir, 0]
        end
    end

    def side_attacks
        attack_pos = [[forward_dir, 1], [forward_dir,-1]].map do |adjust|
            [(adjust[0] + pos[0]),  (adjust[1] + pos[1]) ]
        end
        attack_pos.select do |move|
            ((0..7).include?(move[0]) && 
                (0..7).include?(move[1]) &&
                board[move].color != color && 
                !board[move].empty?)
        end
    end
    


  
  end