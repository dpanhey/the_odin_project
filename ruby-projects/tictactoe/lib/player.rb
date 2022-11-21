# frozen_string_literal: true

# The class for creating new players for TicTacToe
class Player
  attr_reader :players

  def initialize(name1, name2)
    @players = [{
      name: name1,
      sign: 'X'
    }, {
      name: name2,
      sign: 'O'
    }]
  end
end
