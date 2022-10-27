# frozen_string_literal: true

# Top level Documentation for class TicTacToe
class TicTacToe
  def self.start_game
    puts 'Welcome to Tic Tac Toe!'
    set_game_mode
    create_players
    board
  end

  def self.set_game_mode
    @player_mode = false
    puts 'At first, lets set the game mode.'
    puts 'If you want to play against another Player, type Y:'
    @player_mode = true if gets.chomp.downcase == 'y'
  end

  def self.create_players
    @players = Hash.new { |hash, key| hash[key] = hash.dup.clear }
    set_player_name
    set_player_sign
  end

  def self.set_player_name
    # assign the name of player 1
    puts 'To start, please type your Name:'
    @players[:Player1][:name] = gets.chomp
    # assign the name of player 2, if not in computer mode
    return @players[:Player2][:name] = 'The Computer' unless @player_mode

    puts 'Whats the name of the second Player?'
    @players[:Player2][:name] = gets.chomp
  end

  def self.set_player_sign
    puts "Which sign do you want to have #{@players[:Player1][:name]}? X or O?"
    if gets.chomp.downcase == 'x'
      @players[:Player1][:sign] = 'X'
      @players[:Player2][:sign] = 'O'
    else
      @players[:Player1][:sign] = 'O'
      @players[:Player2][:sign] = 'X'
    end
  end

  def self.board
    @board = [%w[_ _ _], %w[_ _ _], %w[_ _ _]]
  end

  def self.display_board
    @board.each { |row| puts " #{row[0]} | #{row[1]} | #{row[2]}" }
  end

  def self.make_turn; end
  def self.check_win_condition; end
  # theodinproject => nested collection => iteration over a nested array
  def self.check_row; end
  def self.check_column; end
  def self.check_diagonal; end
  def self.end_game; end

  def self.test_assignment
    puts @players[:Player1][:name]
    puts @players[:Player1][:sign]
    puts @players[:Player2][:name]
    puts @players[:Player2][:sign]
    puts @player_mode
    display_board
  end
end

TicTacToe.start_game
TicTacToe.test_assignment
