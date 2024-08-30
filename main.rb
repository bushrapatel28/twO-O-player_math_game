require './player.rb'
require './game.rb'
require './io_logic.rb'

print "Enter name for Player 1: "
player1_name = gets.chomp
print "Enter name for Player 2: "
player2_name = gets.chomp

player1 = Player.new(player1_name)
player2 = Player.new(player2_name)

io_logic = IO_LOGIC.new
game = Game.new(player1, player2, io_logic)
game.start