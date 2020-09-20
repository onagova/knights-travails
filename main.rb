require_relative 'lib/board.rb'

$board = KnightsTravails::Board.new(8, 8)

def knight_moves(start, dest)
  path = $board.knight_moves(start, dest)

  if path.nil?
    puts "=> Cannot reach #{dest} from #{start}"
    puts ''
    return
  end

  puts "=> You made it in #{path.size} " +
       "move#{path.size != 1 ? 's' : ''} " +
       "Here's your path:"
  path.each { |coord| puts "  #{coord}" }
  puts ''
end

knight_moves([0,0],[1,2])
knight_moves([0,0],[3,3])
knight_moves([3,3],[0,0])
knight_moves([3,3],[4,3])
