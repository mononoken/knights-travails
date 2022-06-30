# frozen_string_literal: true

require_relative './board'

# Represent a game of chess.
class Game
  def initialize
    @board = Board.new
    @knight = nilre
  end

  def place_knight(coordinate)
    @knight = Knight.new(board.position(coordinate), self)
    board.position(coordinate).add_content(knight)
  end
end
