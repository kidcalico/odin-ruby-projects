require_relative 'game'
require_relative 'board'

class Computer
  include Mastermind

  attr_reader :name

  def initialize
    @codes = COLORS.repeated_permutation(4).to_a.sort_by! { |code| code.uniq.size }
    knuth_array
    @name = 'Computer'
  end

  def knuth_array
    @codes.unshift(%w[R R O O])
    @codes.unshift(%w[Y Y G G])
    @codes.unshift(%w[B B P P])
  end

  def refine_guesses(feedback, guess, board)
    # Eliminate all combinations from the set which do not return the same feedback
    @codes.shift
    if feedback.include?('R') || feedback.include?('W')
      @codes = @codes.select { |code| board.feedback(guess, code).shuffle.sort == feedback.shuffle.sort }
    else
      @codes
    end
  end

  def guess(count, feedback, board)
    refine_guesses(feedback, @guess, board) if count.positive?
    @guess = @codes[0]
    @guess
  end

  def set_code
    @code = []
    4.times { @code.push(COLORS[rand(6)]) }
    @code
  end
end
