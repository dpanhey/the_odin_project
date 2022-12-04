# frozen_string_literal: true

# The class for creating the board with logic for it
class Boardlogic
  attr_accessor :board

  def initialize
    @board = { A: %w[_ _ _], B: %w[_ _ _], C: %w[_ _ _] }
  end
end
