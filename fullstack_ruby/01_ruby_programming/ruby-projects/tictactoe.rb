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
    @win_condition = ''
    until @turn > 9
      players_turn(@turn)
      break if @win_condition.empty? == false
    end
    draw_game if @turn > 9 && @win_condition.empty?
    end_game(@win_condition) if @win_condition.empty? == false
  end

  def self.players_turn(turn)
    @turn = turn
    @players.each_value do |player|
      puts "#{player[:name]}, please first choose the row and second the column to place your sign."
      choose_place(player[:sign])
      display_board
      @win_condition = player[:name] if check_win_condition(player[:sign], @row, @column)
      @turn += 1
      break if turn == 9 || @win_condition.empty? == false
    end
  end

  def self.choose_place(player_sign)
    @row = '', @column = ''
    loop do
      @row = gets.chomp.upcase.to_sym
      @column = gets.chomp.to_i - 1
      break if @board[@row][@column] == '_'

      puts 'Please choose an empty place!'
    end
    @board[@row][@column] = player_sign
  end

  def self.check_win_condition(player_sign, row, column)
    return true if check_row(player_sign, row)
    return true if check_column(player_sign, column)
    return true if check_diagonal1(player_sign)
    return true if check_diagonal2(player_sign)
  end

  def self.check_row(player_sign, row)
    @board.values_at(row)[0].all? { |place| place == player_sign }
  end

  def self.check_column(player_sign, column)
    @board[:A][column] == player_sign && @board[:B][column] == player_sign && @board[:C][column] == player_sign
  end

  def self.check_diagonal1(player_sign)
    @board[:A][0] == player_sign && @board[:B][1] == player_sign && @board[:C][2] == player_sign
  end

  def self.check_diagonal2(player_sign)
    @board[:A][2] == player_sign && @board[:B][1] == player_sign && @board[:C][0] == player_sign
  end

  def self.end_game(player_name)
    puts "Congratulations #{player_name}! You won TicTacToe!"
  end

  def self.draw_game
    puts 'It looks like it is a draw!'
    puts 'You may play again!'
  end
end

TicTacToe.start_game
