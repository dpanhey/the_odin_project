# frozen_string_literal: true

require 'require_all'
require_all 'lib'

# the class for handling the game logic of hangman
class GameLogic
  include DisplayText
  include PickWord
  # the player is allowed 7 mistakes to make
  def initialize
    initialize_content
    make_guess
  end

  def initialize_content
    initialize_hash
    initialize_word
  end

  def initialize_hash
    @game_content = {
      input: '',
      guessing_word: [],
      displaying_word: [],
      guessed_characters: [],
      guesses: {
        guesses: 0,
        mistakes: 0
      }
    }
  end

  def initialize_word
    @game_content[:guessing_word] << choose_random_word('google-10000-english-no-swears.txt')
    @game_content[:displaying_word] = Array.new(1) { '_' * @game_content[:guessing_word][0].length }
    @game_content[:displaying_word][0].gsub!(/(.{1})(?=.)/, '\1 \2')
  end

  def make_guess
    input
    update_guessed_characters
  end

  def validate_guess; end

  def input
    display_string('Please type in one alphabetical character that you didnt choose yet!')
    @game_content[:input] = gets.chomp.downcase
    validate_input
  end

  def validate_input
    input until
      @game_content[:input].length == 1 &&
      @game_content[:input].match?(/[[:alpha:]]/) &&
      !already_guessed? # in zukunft rausziehen in guess methode
  end

  def already_guessed?
    # muss in zukunft geändert werden, statt displaying_word zu guessed_characters
    @game_content[:displaying_word].include?(@game_content[:input])
  end

  def char_included?
    @game_content[:guessing_word].include?(@game_content[:input])
  end

  def update_guessed_characters
    @game_content[:guessed_characters] << @game_content[:input]
    @game_content[:guessed_characters][0].gsub!(/(.{1})(?=.)/, '\1 \2')
  end
end
