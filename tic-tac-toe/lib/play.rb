require_relative "board"
require_relative "turn_methods"

# Play initializes the array and display, and facilitates each turn
class Play
  attr_accessor :board, :last_turn, :spots, :num

  include TurnMethods

  def initialize
    @spots = Array(1..9)
    @board = Board.new
    @last_turn = "O"
  end

  def game
    while (winner?("X") == false) &&
          (winner?("O") == false)
      if spots.all? { |s| s.is_a? String }
        cats_game
        break
      elsif last_turn == "O"
        play("X", "O")
        wins("X") if winner?("X") == true
      elsif last_turn == "X"
        play("O", "X")
        wins("O") if winner?("O") == true
      end
    end
  end

  def play(player, opp)
    @board.show_board(spots)
    puts "Player #{player}, Enter 1-9:".colorize(:blue)
    @num = get_move(player, opp)
    turn(player, opp, num)
  end
end
