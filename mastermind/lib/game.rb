require_relative 'board'

module Mastermind
  COLORS = %w[R O Y G B P].freeze

  class NewGame
  end

  class Game
    def initialize
      puts "Welcome to Mastermind! Please enter 'H' for Human, 'C' for Computer."
      print 'Select the Codemaker (H or C): '
      @codemaker = gets.chomp.upcase[0]
      print 'Select the Codebreaker (H or C): '
      @codebreaker = gets.chomp.upcase[0]
      player_choice
      @board = Board.new
    end

    def player_choice
      @player = [Human.new, Human.new] if @codemaker == 'H' && @codebreaker == 'H'
      @player = [Human.new, Computer.new] if @codemaker == 'H' && @codebreaker == 'C'
      @player = [Computer.new, Computer.new] if @codemaker == 'C' && @codebreaker == 'C'
      @player = [Computer.new, Human.new] if @codemaker == 'C' && @codebreaker == 'H'
    end

    def play
      menu
      @code = @player[0].set_code
      puts "#{@player[0].name} has set the code."
      @count = 0
      12.times do
        @guess = @player[1].guess(@count, @feedback, @board)
        print "\nGuess #{@count + 1}: "
        @board.color(@guess.join)
        if @board.correct?(@code, @guess)
          puts "#{@player[1].name} wins! Great job guessing the correct code!"
          print 'Code: '
          @board.color(@code.join)
          break
        else
          @feedback = @board.feedback(@code, @guess)
          puts "Feedback: #{@feedback.shuffle.join}"
        end
        @count += 1
        puts "#{12 - @count} guesses remain."
      end
      return unless @count == 12 && @board.correct?(@code, @guess) == false

      puts "Too bad, the correct code was #{code}. Try again!"
    end

    def menu
      print 'Color choices: '
      print '[R]ed, '.colorize(:red)
      print '[O]range, '.colorize(:red).on_yellow
      print '[Y]ellow, '.colorize(:yellow)
      print '[G]reen, '.colorize(:green)
      print '[B]lue, '.colorize(:blue)
      print '[P]urple.'.colorize(:magenta)
      print "\n"
    end
  end
end
