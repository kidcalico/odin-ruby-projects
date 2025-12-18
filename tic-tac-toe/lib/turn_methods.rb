require 'colorize'

module TurnMethods
  def winner?(player)
    if @spots[0] == player && @spots[1] == player && @spots[2] == player
      true
    elsif @spots[3] == player && @spots[4] == player && @spots[5] == player
      true
    elsif @spots[6] == player && @spots[7] == player && @spots[8] == player
      true
    elsif @spots[0] == player && @spots[3] == player && @spots[6] == player
      true
    elsif @spots[1] == player && @spots[4] == player && @spots[7] == player
      true
    elsif @spots[2] == player && @spots[5] == player && @spots[8] == player
      true
    elsif @spots[0] == player && @spots[4] == player && @spots[8] == player
      true
    elsif @spots[2] == player && @spots[4] == player && @spots[6] == player
      true
    else
      false
    end
  end

  def turn(person, opp, num)
    if %w[X O].include?(spots[num - 1])
      @last_turn = opp
      puts 'Try again!'.colorize(:red)
    else
      spots[num - 1] = person # .colorize(:green)
      @last_turn = person
    end
  end

  def get_move(player, opp)
    num = gets.chomp
    return num.to_i if num.match?(/^[1-9]$/)

    puts 'Please enter a number 1-9:'.colorize(:blue)
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
