# frozen_string_literal: true

require 'require_all'
require_all 'lib'

# The main class for bundling all classes and modules and starting the game
class TicTacToe
  include DisplayText

  def initialize
    @text_output =
      { start_message: [
        'Welcome to TicaTacToe!',
        'To start, please type in your names one after another!'
      ] }
  end

  def intro
    display_multiline_string(@text_output[:start_message])
    @players = Player.new
    display_string("Alright, lets begin with #{@players.players[0][:name]}!")
  end
end

TicTacToe.new.intro
