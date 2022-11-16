# frozen_string_literal: true

# Top level Documentation for class TicTacToe
class TicTacToe
  @players = Hash.new { |hash, key| hash[key] = hash.dup.clear }
  @board = { A: %w[_ _ _], B: %w[_ _ _], C: %w[_ _ _] }

  def self.start_game
    puts 'Welcome to Tic Tac Toe!'
    assign_player_name
    assign_player_sign
    make_turn
  end

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

  def self.display_board
    puts '  1   2   3 '
    @board.each_pair { |key, value| puts "#{key} #{value[0]} | #{value[1]} | #{value[2]}" }
  end

  def self.make_turn
    @turn = 1
    until @turn > 9
      players_turn(@turn)
      end_game if @turn > 9
    end
  end

  def self.players_turn(turn)
    @turn = turn
    @players.each_value do |player|
      puts "#{player[:name]}, bitte wähle zuerst die Reihe und danach die Spalte für dein Zeichen."
      choose_place
      @board[@row][@column] = player[:sign]
      display_board
      @turn += 1
      break if turn == 9
    end
  end

  def self.choose_place
    @row = '', @column = ''
    loop do
      @row = gets.chomp.upcase.to_sym
      @column = gets.chomp.to_i - 1
      break if @board[@row][@column] == '_'

      puts 'Please choose an empty place!'
    end
  end

  def self.check_win_condition
    check_row
    check_column
    check_diagonal
  end

  # refactor check condition
  # X has to be player 1 or player 2 sign, depends on last set sign
  def self.check_row(player_sign)
    @board.each_pair { |_row, column| return end_game if column.all? { |signs| signs == player_sign } }
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
