# frozen_string_literal: true

# Top level Documentation for class TicTacToe
class TicTacToe
  @players = Hash.new { |hash, key| hash[key] = hash.dup.clear }
  @board = { A: %w[_ _ _], B: %w[_ _ _], C: %w[_ _ _] }

  def self.start_game
    puts 'Welcome to Tic Tac Toe!'
    assign_player_name
    assign_player_sign
    display_board
    check_win_condition
  end

  # def self.set_game_mode
  #  @player_mode = false
  #  puts 'At first, lets set the game mode.'
  #  puts 'If you want to play against another Player, type Y:'
  #  @player_mode = true if gets.chomp.downcase == 'y'
  # end

  # def self.create_players
  #  @players = Hash.new { |hash, key| hash[key] = hash.dup.clear }
  #  assign_player_name
  #  assign_player_sign
  # end

  def self.assign_player_name
    # assign the name of player 1
    puts 'To start, please type your Name:'
    @players[:Player1][:name] = gets.chomp
    puts 'Whats the name of the second Player?'
    @players[:Player2][:name] = gets.chomp
  end

  def self.assign_player_sign
    puts "Which sign do you want to have #{@players[:Player1][:name]}? X or O?"
    if gets.chomp.downcase == 'x'
      @players[:Player1][:sign] = 'X'
      @players[:Player2][:sign] = 'O'
    else
      @players[:Player1][:sign] = 'O'
      @players[:Player2][:sign] = 'X'
    end
  end

  # def self.board
  #  @board = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
  # end

  def self.display_board
    puts '  1   2   3 '
    @board.each_pair { |key, value| puts "#{key} #{value[0]} | #{value[1]} | #{value[2]}" }
  end

  def self.make_turn; end

  def self.check_win_condition
    check_row
    check_column
    check_diagonal
  end

  # refactor check condition
  # X has to be player 1 or player 2 sign, depends on last set sign
  def self.check_row
    @board.each { |row| return end_game if row[0] == 'X' && row[1] == 'X' && row[2] == 'X' }
  end

  def self.check_column; end
  def self.check_diagonal; end

  def self.end_game
    puts 'Game is over!'
  end

  def self.test_assignment
    puts @players[:Player1][:name]
    puts @players[:Player1][:sign]
    puts @players[:Player2][:name]
    puts @players[:Player2][:sign]
  end
end

TicTacToe.start_game
TicTacToe.test_assignment
