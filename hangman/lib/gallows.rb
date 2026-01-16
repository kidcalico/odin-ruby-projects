require 'colorize'

module Gallows
  # attr_accessor :mistakes

  # @mistakes = [mistake_one, mistake_two, mistake_three, mistake_four, mistake_five, mistake_six, mistake_seven,
  #              mistake_eight]

  def mistake_one
    puts '    ___'
    puts '   |   |'
    puts '   |'
    puts '   |'
    puts '   |'
    puts '   |'
    puts ' __|__'
  end

  def mistake_two
    puts '    ___'
    puts '   |   |'
    puts '   |   O'
    puts '   |'
    puts '   |'
    puts '   |'
    puts ' __|__'
  end

  def mistake_three
    puts '    ___'
    puts '   |   |'
    puts '   |   O'
    puts '   |   |'
    puts '   |'
    puts '   |'
    puts ' __|__'
  end

  def mistake_four
    puts '    ___'
    puts '   |   |'
    puts '   |   O'
    puts '   |   |'
    puts '   |   |'
    puts '   |'
    puts ' __|__'
  end

  def mistake_five
    puts '    ___'
    puts '   |   |'
    puts '   |   O'
    puts '   |  /|'
    puts '   |   |'
    puts '   |'
    puts ' __|__'
  end

  def mistake_six
    puts '    ___'
    puts '   |   |'
    puts '   |   O'
    puts '   |  /|\\'
    puts '   |   |'
    puts '   |'
    puts ' __|__'
  end

  def mistake_seven
    puts '    ___'
    puts '   |   |'
    puts '   |   O'
    puts '   |  /|\\'
    puts '   |   |'
    puts '   |  /'
    puts ' __|__'
    puts "One more mistake allowed!!!\n\n".red
  end

  def mistake_eight
    puts '    ___'
    puts '   |   |'
    puts '   |   O'
    puts '   |  /|\\'
    puts '   |   |'
    puts '   |  / \\'
    puts ' __|__'
  end
end
