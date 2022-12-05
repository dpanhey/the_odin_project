# frozen_string_literal: true

require 'require_all'
require_all 'lib'

# The main class for bundling all classes and modules and starting the game
class TicTacToe
  def initialize
    game = Game.new
    game.intro
  end
end

TicTacToe.new
