# frozen_string_literal: true

# The class for creating new players for TicTacToe
class Player
  include DisplayText
  attr_reader :players

  def initialize
    create_players(gets.chomp, gets.chomp)
  end

  def create_players(name1, name2)
    @players = [{
      name: name1,
      sign: 'X'
    }, {
      name: name2,
      sign: 'O'
    }]
  end
end
