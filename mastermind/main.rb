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

require_relative 'lib/human'
require_relative 'lib/computer'
require_relative 'lib/game'
require_relative 'lib/board'

include Mastermind

game = Game.new

game.play
