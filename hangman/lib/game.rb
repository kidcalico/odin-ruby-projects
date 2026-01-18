require_relative 'gallows'

class Game
  include Gallows

  attr_accessor :round, :correct, :errs

  def initialize(
    dictionary = Dictionary.new.build_dictionary,
    round = 0,
    correct = [],
    errs = []
  )
    @hangman_dictionary = dictionary
    @round = round
    @correct = correct
    @errs = errs
    first_turn
  end

  def set_word
    @word = @hangman_dictionary[@round]
  end

  def first_turn
    puts "Round #{@round + 1}, go!"
    set_word
    which_mistake
    display_field
    turn
  end

  def turn
    print "\nEnter a letter (a-z), or 'save' or 'exit': "
    get_guess
    correct_or_err(@guess)
    turn_output
  end

  def turn_output
    which_mistake
    display_field
    winner?
  end

  def display_field
    @field = []
    @word.each_char do |char|
      @field << if @correct.include?(char)
                  char
                else
                  '_'
                end
    end
    puts @field.join(' ')
  end

  def correct_or_err(guess)
    if @word.include?(guess)
      @correct << guess
    else
      @errs << guess
    end
  end

  def which_mistake
    return unless @errs.length.between?(1, 8)

    puts 'Mistakes: ' + "#{@errs.join(' ')}".strike.red
    send("mistake_#{@errs.length}")
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

  def get_guess
    @count = 0
    loop do
      print 'Try a different guess (a-z): ' if @count > 0
      @guess = gets.chomp.downcase
      if @guess == 'save'
        save = StartScreen.new
        save.save_game(@hangman_dictionary, @round, @correct, @errs)
        exit
      elsif @guess == 'exit'
        play_again
        exit
      end
      @guess = @guess[0]
      puts 'You already guessed that!' if @errs.include?(@guess) || @correct.include?(@guess)
      break if ('a'..'z').to_a.include?(@guess) && !@errs.include?(@guess) && !@correct.include?(@guess)

      @count += 1
    end
  end

  def play_again
    print 'Do you want to play again? (Y/N): '
    @reset = gets.chomp.upcase[0]
    if @reset == 'N'
      puts 'See you next time!'
    elsif @reset == 'Y'
      @round += 1
      @errs = []
      @correct = []
      first_turn
    else
      play_again
    end
  end
end
