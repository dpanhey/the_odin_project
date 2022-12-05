# frozen_string_literal: true

require 'require_all'
require_all 'lib'

# The main class for bundling all classes and modules and starting the game
class TicTacToe
  include DisplayText
  def intro
    intro_message
    @players = Player.new
    start_message
  end
end

game = TicTacToe.new
game.intro
