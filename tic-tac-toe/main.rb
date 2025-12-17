# require 'pry-byebug'

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

  def x_turn(num)
    if spots[num-1] == "X" || spots[num-1] == "O"
      @last_turn = "O"
      puts "Try again!"
    else
      spots[num-1] = "X"
      @last_turn = "X"
    end
  end

  def o_turn(num)
    if spots[num-1] == "X" || spots[num-1] == "O"
      @last_turn = "X"
      puts "Try again!"
    else
      spots[num-1] = "O"
      @last_turn = "O"
    end
  end

  def x_wins
    @board.show_board(@spots)
    puts "X is the winner!"
  end

  def o_wins
    @board.show_board(@spots)
    puts "O is the winner!"
  end

  # Add Cat's Game Logic
end

class Board
  def show_board(spots)
    puts " #{spots[0]} | #{spots[1]} | #{spots[2]} "
    puts "-----------"
    puts " #{spots[3]} | #{spots[4]} | #{spots[5]} "
    puts "-----------"
    puts " #{spots[6]} | #{spots[7]} | #{spots[8]} "
  end
end

class Play
  attr_accessor :board, :last_turn, :spots
  include TurnMethods

  def initialize
    @spots = Array(1..9)
    @board = Board.new
    @last_turn = "O"
  end

# Instead of x and o, have one turn(player) method

  def x
    @board.show_board(@spots)
    puts "Player X, Enter 1-9:"
    num = gets.chomp.to_i
    x_turn(num)
  end
  
  def o
    @board.show_board(spots)
    puts "Player O, Enter 1-9:"
    num = gets.chomp.to_i
    o_turn(num)
  end
end

# binding.pry

new_game = Play.new
while (new_game.is_winner?("X") == false) &&
  (new_game.is_winner?("O") == false) do
  if new_game.spots.all? { |s| s.is_a? String }
    new_game.board.show_board(new_game.spots)
    puts "Cat's game! Try again."
    break
  elsif new_game.last_turn == "O"
    new_game.x
    if new_game.is_winner?("X") == true
      new_game.x_wins
    end
  elsif new_game.last_turn == "X"
    new_game.o
    if new_game.is_winner?("O") == true
      new_game.o_wins
    end
  end
end