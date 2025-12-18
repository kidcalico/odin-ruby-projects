require_relative 'lib/board'
require_relative 'lib/play'

new_game = Play.new

while (new_game.winner?('X') == false) &&
      (new_game.winner?('O') == false)
  if new_game.spots.all? { |s| s.is_a? String }
    new_game.cats_game
    break
  elsif new_game.last_turn == 'O'
    new_game.play('X', 'O')
    new_game.wins('X') if new_game.winner?('X') == true
  elsif new_game.last_turn == 'X'
    new_game.play('O', 'X')
    new_game.wins('O') if new_game.winner?('O') == true
  end
end
