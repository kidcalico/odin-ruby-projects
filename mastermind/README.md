# The Odin Project, Ruby Course: Mastermind

This is my version of the classic game Mastermind. I was very happy to 
create a clone of this game that I used to play as a child.

## How to Play

Mastermind is a two player game. The "Codemaker" creates a code, which 
the "Codebreaker" will try to guess. There are six colors, represented in the game by their first letter:

* [R]ed
* [O]range
* [Y]ellow
* [G]reen
* [B]lue
* [P]urple

Codes can consist of any combination of the colors, including repeated 
colors. After each guess, feedback is given: 

* 'X' for a wrong guess
* 'R' (red) for the correct guess in the right spot
* 'W' (white) for the correct guess in wrong spot

The order of the given feedback is shuffled and *does not* correspond 
to the order of the guesses. The Codebreaker has 12 chances to guess the correct code.

At the start of the game, the user decides whether the codemaker and codebreaker are played by a human (H) or computer (C). If the codemaker and/or codebreaker is human, the human needs to enter four letters from the above choices, representing the four colors.

This game is only usable in the terminal for the time being.