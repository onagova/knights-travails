module KnightsTravails
  class Knight
    def self.get_possible_moves(board, pos)
      moves = []
      moves << [pos[0] - 2, pos[1] - 1]
      moves << [pos[0] - 2, pos[1] + 1]
      moves << [pos[0] - 1, pos[1] - 2]
      moves << [pos[0] - 1, pos[1] + 2]
      moves << [pos[0] + 1, pos[1] - 2]
      moves << [pos[0] + 1, pos[1] + 2]
      moves << [pos[0] + 2, pos[1] - 1]
      moves << [pos[0] + 2, pos[1] + 1]
      moves.reject { |move| board.out_of_bounds?(move) }
    end
  end
end
