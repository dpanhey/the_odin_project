# frozen_string_literal: true

# The class for playing the game
class Game
  include DisplayText
  include TurnLogic

  def initialize
    intro
    initialize_variables
  end

  def intro
    intro_message
    @players = Player.new
    start_message
  end

  def initialize_variables
    @board = Boardlogic.new
    @turn = 1
    @current_player_id = 0
  end
end
