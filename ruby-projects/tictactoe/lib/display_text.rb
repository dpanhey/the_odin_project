# frozen_string_literal: true

# The Module for text and board output
module DisplayText
  def display_board(board)
    puts '  1   2   3 '
    board.each_pair { |key, value| puts "#{key} #{value[0]} | #{value[1]} | #{value[2]}" }
  end
end
