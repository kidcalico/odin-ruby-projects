require "colorize"

# TurnMethods defines behavior for each turn, and holds methods to
# check for a winner, as well as returning gameplay feedback.
module TurnMethods
  LINES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  def winner?(player)
    LINES.any? do |line|
      line.all? { |spot| @spots[spot] == player }
    end
  end

  def turn(person, opp, num)
    if %w[X O].include?(spots[num - 1])
      @last_turn = opp
      puts "Try again!".colorize(:red)
    else
      spots[num - 1] = person
      @last_turn = person
    end
  end

  def get_move(player, opp)
    num = gets.chomp
    return num.to_i if num.match?(/^[1-9]$/)

    puts "Please enter a number 1-9:".colorize(:blue)
    get_move(player, opp)
  end

  def wins(person)
    @board.show_board(@spots)
    puts "#{person} is the winner!".colorize(:yellow)
  end

  def cats_game
    @board.show_board(@spots)
    puts "Cat's game! Try again.".colorize(:green)
  end
end
