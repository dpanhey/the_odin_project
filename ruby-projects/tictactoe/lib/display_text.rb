# frozen_string_literal: true

# The Module for text and board output
module DisplayText
  def display_board(board)
    puts '  1   2   3 '
    board.each_pair { |key, value| puts "#{key} #{value[0]} | #{value[1]} | #{value[2]}" }
  end

  def display_string_sleep(string)
    string.each_char do |char|
      print char
      sleep 0.25
      $stdout.flush
    end
  end

  def display_multiline_string_sleep(array)
    array.each do |element|
      display_string_sleep(element)
      print "\n"
      sleep 1
    end
  end
end
