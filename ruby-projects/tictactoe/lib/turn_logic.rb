# frozen_string_literal: true

# The module for the whole turn logic of TicTacToe
module TurnLogic
  def other_player_id
    1 - @current_player_id
  end

  def switch_player!
    @current_player_id = other_player_id
  end

  def current_player
    @player[current_player_id]
  end
end
