# frozen_string_literal: true

# The Module for text and board output
module DisplayText
  def display_board(board)
    puts '  1   2   3 '
    board.each_pair { |key, value| puts "#{key} #{value[0]} | #{value[1]} | #{value[2]}" }
  end

  def display_word_sleep(word)
    word.each_char do |char|
      print char
      sleep 0.05
      $stdout.flush
    end
  end

  def display_string(string)
    display_word_sleep(string)
    print "\n"
  end

  def display_multiline_string(array)
    array.each do |element|
      display_word_sleep(element)
      print "\n"
      sleep 0.5
    end
  end

  def intro_message
    display_multiline_string(['Welcome to TicaTacToe!',
                              'To start, please type in your names one after another!'])
  end

  def start_message
    display_string("Alright, lets begin with #{@players.players[0][:name]}!")
  end
end
