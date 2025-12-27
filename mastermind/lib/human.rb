# frozen_string_literal: true

class Human
  attr_reader :code

  def guess
    puts "Enter your guess of four colors (eg, 'RYOG'):"
    @guess = gets.chomp
  end

  def set_code
    puts "Enter your code of four colors (eg, 'PBGY'):"
    @code = gets.chomp
  end
end
