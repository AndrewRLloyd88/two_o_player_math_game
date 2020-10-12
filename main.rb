#main will require all other files

require './player.rb'
require './gamestate.rb'
# require './questions.rb'
# require './messageclass.rb'
# require './turns.rb'
# require './questionbank.rb'

gamestate = Game.new
gamestate.nextTurn