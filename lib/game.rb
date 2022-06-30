# frozen_string_literal: true

require_relative './board'

# Represent a game of chess.
class Game
  def initialize
    @board = Board.new
    @knight = nil
  end

  def place_knight(coordinate)
    @knight = Knight.new(position(coordinate), self)
    position(coordinate).add_content(knight)
  end
end
