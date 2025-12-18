require_relative 'board'
require_relative 'turn_methods'

class Play
  attr_accessor :board, :last_turn, :spots, :num

  include TurnMethods

  def initialize
    @spots = Array(1..9)
    @board = Board.new
    @last_turn = 'O'
  end

  def play(player, opp)
    @board.show_board(spots)
    puts "Player #{player}, Enter 1-9:"
    @num = get_move(player, opp)
    turn(player, opp, num)
  end
end
