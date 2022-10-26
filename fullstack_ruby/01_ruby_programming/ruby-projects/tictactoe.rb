# frozen_string_literal: true

# Top level Documentation for class TicTacToe
class TicTacToe
  def self.start_game
    puts 'Welcome to Tic Tac Toe!'
    set_game_mode
  end

  def self.set_game_mode
    @computer_mode = true
    puts 'At first, lets set the game mode.'
    puts 'If you want to play against another Player, type Y:'
    @computer_mode = false if gets.chomp.downcase == 'y'
    set_player_name
  end

  def self.set_player_name
    puts 'To start, please insert your Name:'
    @player1_name = gets.chomp
    unless @computer_mode
      puts 'Whats the name of the second Player?'
      @player2_name = gets.chomp
    end
    set_player_sign
  end

  def self.set_player_sign
    puts "Which sign do you want to have #{@player1_name}? X or O?"
    if gets.chomp.downcase == 'x'
      @player1_sign = 'X'
      @computer_mode ? @computer_sign = 'O' : @player2_sign = 'O'
    else
      @player1_sign = 'O'
      @computer_mode ? @computer_sign = 'X' : @player2_sign = 'X'
    end
  end

  def self.board_status; end
  def self.display_board; end
  def self.make_turn; end
  def self.check_win_condition; end
  def self.check_row; end
  def self.check_column; end
  def self.check_diagonal; end
  def self.end_game; end

  def self.test_assignment
    puts @player1_name
    puts @player1_sign
    puts @player2_name
    puts @player2_sign
    puts @computer_mode
    puts @computer_sign
  end
end

TicTacToe.start_game
TicTacToe.test_assignment