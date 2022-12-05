# frozen_string_literal: true

# The class for creating the board with logic for it
class Boardlogic
  attr_accessor :board

  def initialize
    @board = { A: %w[_ _ _], B: %w[_ _ _], C: %w[_ _ _] }
  end

  def check_win_condition(player_sign, row, column)
    return true if check_row(player_sign, row)
    return true if check_column(player_sign, column)
    return true if check_diagonal1(player_sign)
    return true if check_diagonal2(player_sign)
  end

  def check_row(player_sign, row)
    @board.values_at(row)[0].all? { |place| place == player_sign }
  end

  def check_column(player_sign, column)
    @board[:A][column] == player_sign && @board[:B][column] == player_sign && @board[:C][column] == player_sign
  end

  def check_diagonal1(player_sign)
    @board[:A][0] == player_sign && @board[:B][1] == player_sign && @board[:C][2] == player_sign
  end

  def check_diagonal2(player_sign)
    @board[:A][2] == player_sign && @board[:B][1] == player_sign && @board[:C][0] == player_sign
  end
end
