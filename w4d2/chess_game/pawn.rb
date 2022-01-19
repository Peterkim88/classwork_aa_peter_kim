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
        attack_pos = [ [forward_dir, 1], [forward_dir,-1]]
        valid_attacks = attack_pos.select do |move|
            if board[move]
    end
    


  
  end