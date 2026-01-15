#    ___
#   │   │
#   │   O
#   │  /|\
#   │   |
#   │  / \
# __│__

require 'pry-byebug'
require 'rubocop'
require_relative 'lib/gallows'

class Game

  include Gallows

  attr_accessor :word, :hangman_dictionary

  def initialize
    @hangman_dictionary = []
    @field = []
    @errs = []
    @correct = []
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
    @word = @hangman_dictionary[rand(@hangman_dictionary.length)]
  end
  
  def first_turn
    build_dictionary
    set_word
    @field = []
    @word.each_char do |char|
      @field << '_'
    end
    puts @field.join(' ')
    get_guess
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

  def turn_output
    @field = []
    @word.each_char do |char|
      if @correct.include?(char)
        @field << char
      else
        @field << "_"
      end
    end
    puts "Mistakes: #{@errs.join(' ')}"
    which_mistake
    puts @field.join(' ')
    
    winner?

  end

  def mistake

  end

  def winner?
    if @field.join == @word
      puts "\nCongratulations, you guessed the word!"
    elsif @errs.length == 8
      puts "\nSorry, try again! The correct word was \"#{@word}\""
    else
      get_guess
    end
  end

  def get_guess
    print "\nEnter a letter (a-z): "
    @guess = gets.chomp.downcase[0] 
    # until (('A'..'Z').to_a + ('a'..'z').to_a).include?(@guess) 
    correct_or_err(@guess)
    turn_output
  end
  
end

g = Game.new