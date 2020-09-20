require_relative 'essentials.rb'
require_relative 'knight.rb'

module KnightsTravails
  class Board
    def initialize(row_count, col_count)
      @row_count = row_count
      @col_count = col_count
    end

    def knight_moves(start, dest)
      if out_of_bounds?(start)
        raise CustomError.new("coord #{start} out of bounds")
      elsif out_of_bounds?(dest)
        raise CustomError.new("coord #{dest} out of bounds")
      end

      visited = []
      queue = [[[start], []]]

      until queue.empty?
        next_moves, path = queue.shift

        return path << dest if next_moves.include? dest

        next_moves.each do |pos|
          new_moves = Knight.get_possible_moves(self, pos)
          new_moves.reject! { |move| visited.include?(move) }
          queue << [new_moves, path.clone << pos]
          visited << pos
        end
      end
      nil
    end

    def out_of_bounds?(coord)
      coord[0] < 0 || coord[1] < 0 ||
      coord[0] >= @row_count || coord[1] >= @col_count
    end
  end
end
