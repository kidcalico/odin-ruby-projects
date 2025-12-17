require 'colorize'

module TurnMethods
  def is_winner?(player)
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
    if spots[num-1] == "X" || spots[num-1] == "O"
      @last_turn = opp
      puts "Try again!".colorize(:red)
    else
      spots[num-1] = person
      @last_turn = person
    end
  end

  def get_move(player, opp)
    num = gets.chomp
    if !!(num.match?(/^[1-9]$/))
      return num.to_i
    else
      puts "Please enter a number 1-9:".colorize(:blue)
      get_move(player, opp)
    end
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