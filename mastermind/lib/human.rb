# frozen_string_literal: true

class Human
  attr_reader :name

  def initialize
    @name = 'Human'
  end

  def guess(count, feedback, board)
    puts "Enter your guess of four colors (eg, 'RYOG'):"
    @guess = input
  end

  def set_code
    puts "Enter your code of four colors (eg, 'PBGY'):"
    @code = input
  end

  def input
    @count = 0
    loop do
      if @count != 0
        puts 'Color choices: [R]ed, [O]range, [Y]ellow, [G]reen, [B]lue, [P]urple.'
        puts 'Invalid entry, please enter any combination of exactly 4 colors:'
      end
      @input = gets.chomp.upcase.split('')
      return @input if @input.length == 4 && @input.map { |c| %w[R O Y G B P].include?(c) }.all?

      @count += 1
    end
  end
end
