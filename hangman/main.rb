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
require 'yaml'

require_relative 'lib/dictionary'
require_relative 'lib/game'

class StartScreen

  def opening_menu
    puts "Welcome to Hangman, would you like to load a saved game or start a new game?"
    print "[N]ew or [L]oad: "
    input = gets.chomp.downcase[0]
    case input
      when 'n' then Game.new
      when 'l' then self.load_game 
      else self.opening_menu
    end
  end
  
  def save_game(hangman_dictionary, round, correct, errs)
    print "Save as (enter a keyword): "
    @keyword = gets.chomp.downcase
    @saving = { :hangman_dictionary => hangman_dictionary,
                :round => round,
                :correct => correct,
                :errs => errs
              }
    yaml = YAML::dump(@saving)
    file = File.new("#{@keyword}.yaml", "w")
    file.write(yaml)
    exit
  end

  def load_game
    print "Enter the name of your saved file: "
    @keyword = gets.chomp.downcase
    if File.exist?("#{@keyword}.yaml")
      load = YAML.load_file("#{@keyword}.yaml")
      Game.new(load[:hangman_dictionary], load[:round], load[:correct], load[:errs])
    else 
      puts "File does not exist, please try again."
      self.load_game
    end
  end
end

StartScreen.new.opening_menu