require 'pry'

require_relative './tictactoe/player'
require_relative './tictactoe/board'
require_relative './tictactoe/game'

if $PROGRAM_NAME == __FILE__
  print "Player 1, what is your name? > "
  name1 = gets.chomp

  print "Player 2, what is your name? > "
  name2 = gets.chomp

  ttt = TicTacToe::Game.new name1, name2
  ttt.play!

  if ttt.winner
    puts "#{ttt.winner.name} wins!"
  else
    puts "It's a draw"
  end
end
