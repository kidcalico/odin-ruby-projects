# Two types of players: Human and Computer
# Two player roles: Codemaker and Codebreaker

# Gameplay:
# 6 colors for code pegs: Red, Yellow, Green, Blue, Orange, Purple
# 2 colors for feedback pegs: Red, White
# Codemaker generates a sequence of four code pegs, repeated colors are allowed
# Codebreaker guesses and is given feedback on each guess.
# Red = correct color, correct spot 
# White = correct color *only*
# Codebreaker has twelve chances to guess the secret code

require 'pry-byebug'
require 'colorize'
require 'colorized_string'

module Mastermind
  COLORS = ['R', 'Y', 'G', 'B', 'O', 'P']

  class Human
    attr_reader :guess, :code

    def guess
      puts "Enter your guess of four colors (eg, 'RYOG'):"
      @guess = gets.chomp
    end

    def set_code
      puts "Enter your code of four colors (eg, 'PBGY'):"
      @code = gets.chomp
    end
  end
  
  class Computer
    attr_reader :code, :color
    
    def set_code
      # code = ['B', 'P', 'Y', 'Y']
      code = []
      4.times {code.push(rand_color)}
      code.join
    end
    
    def rand_color
      color = COLORS[rand(6)]
      color
    end
  end
  
  class CodeMaker
    # def initialize
    #   @code_maker = Computer.new
    # end
    
    # def set_code
    #   @code_maker.color_select
    # end
  end
  
  class CodeBreaker
  end
  
  class Game
    def initialize(codemaker, codebreaker)
      # @code_maker = CodeMaker.new

      @code_maker_id = 0
      @code_breaker_id = 1
      @player = [codemaker.new(), codebreaker.new()]
    end
    attr_reader :code_maker_id, :code_breaker_id, :player, :code
    attr_accessor :guess

    def play
      @code = @player[0].set_code
      puts "Computer has set the code."
      puts "Color choices: [R]ed, [O]range, [Y]ellow, [G]reen, [B]lue [P]urple, "
      @count = 0
      12.times do
        @guess = @player[1].guess
        if correct?(@code, @guess)
          puts "You win! Great job guessing the correct code!"
          puts "Code: #{@code}"
          break
        else
          feedback(@code, @guess)
        end
        @count += 1
        puts "#{12 - @count} guesses remain."
      end
      if @count == 12 && correct?(@code, @guess) == false
        puts "Too bad, the correct code was #{code}. Try again!"
      end
    end
  
    def board
    end
  
    def guess
      gets.chomp
    end
  
    def feedback(code, guess)
      @code_arr = code.split('')
      @guess_arr = guess.split('')

      @feedback = []
      @guess_arr.each_with_index do |g, i| 
        if g == @code_arr[i]
          @feedback << "R"
          @code_arr[i] = "X"
          @guess_arr[i] = "X"
        end
      end

      @guess_arr.each_with_index do |g, i| 
        if g == "X"
          next
        elsif @code_arr.include?(g)
          @feedback << "W"
          @code_arr[@code_arr.index(g)] = "X"
          @guess_arr[i] = "X"
        end
        # binding.pry
      end
      # p @guess_arr
      # p code
      # p @code_arr
      # p @feedback
      print "Your guess: "
      color(@guess)
      puts "Feedback: #{@feedback.shuffle.join}"
    end

    def correct?(code, guess)
      code == guess
    end

    def color(guess)
      arr = guess.split('')
      arr.each do |g|
        if g == "R"
          print "R".colorize(:red)
        elsif g == "O"
          print "O".colorize(:yellow).on_red
        elsif g == "Y"
          print "Y".colorize(:yellow)
        elsif g == "G"
          print "G".colorize(:green)
        elsif g == "B"
          print "B".colorize(:blue)
        elsif g == "P"
          print "P".colorize(:magenta)
        end
      end
      print "\n"
    end
  end
end

include Mastermind

player = Game.new(Computer, Human)

player.play