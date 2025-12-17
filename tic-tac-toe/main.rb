require_relative 'lib/board'
require_relative 'lib/play'

new_game = Play.new

while (new_game.is_winner?("X") == false) &&
  (new_game.is_winner?("O") == false) do
  if new_game.spots.all? { |s| s.is_a? String }
    new_game.cats_game
    break
  elsif new_game.last_turn == "O"
    new_game.play("X", "O")
    if new_game.is_winner?("X") == true
      new_game.wins("X")
    end
  elsif new_game.last_turn == "X"
    new_game.play("O", "X")
    if new_game.is_winner?("O") == true
      new_game.wins("O")
    end
  end
end