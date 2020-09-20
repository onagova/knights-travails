require_relative 'board.rb'

module KnightsTravails
  class KnightJourney
    attr_reader :position, :history, :possible_moves

    def initialize(board, position, history = [])
      @board = board
      @position = position
      @history = history
      @possible_moves = nil
      update_possible_moves
    end

    def get_future_instances
      @possible_moves.map do |next_pos|
        KnightJourney.new(@board, next_pos, history.clone << position)
      end
    end

    private

    def update_possible_moves
      @possible_moves = []
      @possible_moves << [@position[0] + 2, @position[1] + 1]
      @possible_moves << [@position[0] + 2, @position[1] - 1]
      @possible_moves << [@position[0] - 2, @position[1] + 1]
      @possible_moves << [@position[0] - 2, @position[1] - 1]
      @possible_moves << [@position[0] + 1, @position[1] + 2]
      @possible_moves << [@position[0] - 1, @position[1] + 2]
      @possible_moves << [@position[0] + 1, @position[1] - 2]
      @possible_moves << [@position[0] - 1, @position[1] - 2]
      @possible_moves.reject { |move| @board.out_of_bounds?(move) }
    end
  end
end
