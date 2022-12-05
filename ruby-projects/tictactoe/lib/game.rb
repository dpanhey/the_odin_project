# frozen_string_literal: true

# The class for playing the game
class Game
  include DisplayText

  def intro
    intro_message
    @players = Player.new
    start_message
  end
end
