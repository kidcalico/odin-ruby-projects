#    ___
#   │   │
#   │   O
#   │  /|\
#   │   |
#   │  / \
# __│__

require 'pry-byebug'
require 'rubocop'
require 'colorize'
require_relative 'lib/gallows'

class Game

  include Gallows

  def initialize
    @hangman_dictionary = []
    @round = 0
    build_dictionary
    first_turn
  end
  
  def build_dictionary
    File.open("./google-10000-english-no-swears.txt", "r") do |file|
      for line in file.readlines()
        if line.chomp.length >= 5 && line.chomp.length <= 12
          @hangman_dictionary << line.chomp
        end
      end
      @hangman_dictionary.shuffle!
    end
  end
  
  def set_word
    @word = @hangman_dictionary[@round]
  end
  
  def first_turn
    @errs = []
    @correct = []
    set_word
    display_field
    turn
  end
  
  def display_field
    @field = []
    @word.each_char do |char|
      if @correct.include?(char)
        @field << char
      else
        @field << "_"
      end
    end
    puts @field.join(' ')
  end
  
    def turn_output
      puts "Mistakes: " + "#{@errs.join(' ')}".strike.red
      which_mistake
      display_field
      winner?
    end

  def correct_or_err(guess)
    if @word.include?(guess)
      @correct << guess
    else
      @errs << guess
    end
  end

  def which_mistake
    if @errs.length == 1
      mistake_one
    elsif @errs.length == 2
      mistake_two
    elsif @errs.length == 3
      mistake_three
    elsif @errs.length == 4
      mistake_four
    elsif @errs.length == 5
      mistake_five
    elsif @errs.length == 6
      mistake_six
    elsif @errs.length == 7
      mistake_seven
    elsif @errs.length == 8
      mistake_eight
    end
  end

  def winner?
    if @field.join == @word
      puts "\nCongratulations, you guessed the word!"
      play_again
    elsif @errs.length == 8
      puts "\nSorry, try again! The correct word was " + "\"#{@word}\"".green
      play_again
    else
      turn
    end
  end

  def turn
    print "\nEnter a letter (a-z): "
    get_guess
    correct_or_err(@guess)
    turn_output
  end
  
  def get_guess
    @count = 0
    loop do
      print "Try a different guess (a-z): " if @count > 0
      @guess = gets.chomp.downcase[0]
      puts "You already guessed that!" if @errs.include?(@guess) || @correct.include?(@guess)
      break if ('a'..'z').to_a.include?(@guess) && !@errs.include?(@guess) && !@correct.include?(@guess)
      @count += 1
    end
  end

  def play_again
    print "Do you want to play again? (Y/N): "
    @reset = gets.chomp.upcase[0]
    if @reset == 'N'
      puts "See you next time!"
    elsif @reset == 'Y'
      @round += 1
      puts "Round #{@round + 1}, go!"
      first_turn
    else
      self.play_again
    end
  end
end

Game.new