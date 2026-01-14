require_relative 'game'
require_relative 'board'

# frozen_string_literal: true

class Computer
  include Mastermind

  attr_reader :name

  ALL_CODES = COLORS.repeated_permutation(4).to_a.sort_by! { |code| code.uniq.size }

  def initialize
    @codes = ALL_CODES
    @name = 'Computer'
  end

  def refine_guesses(feedback, guess, board)
    # Eliminate all combinations from the set which do not return the same feedback
    if feedback.include?('R') || feedback.include?('W')
      @codes.shift
      @codes = @codes.reject { |code| board.feedback(guess, code).shuffle.sort != feedback.shuffle.sort }
    else
      @codes.shift
      @codes
    end
  end

  def guess(count, feedback, board)
    refine_guesses(feedback, @guess, board) if count > 0
    @guess = @codes[0]
    @guess
  end

  def set_code
    @code = []
    4.times { @code.push(rand_color) }
    @code
  end

  def rand_color
    COLORS[rand(6)]
  end
end
