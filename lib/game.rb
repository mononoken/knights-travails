# frozen_string_literal: true

require_relative './board'
require_relative './knight'
require_relative './position'

# Represent a game of chess.
class Game
  attr_reader :board, :knight

  def initialize
    @board = Board.new
    @knight = nil
  end

  def place_knight(coordinate)
    @knight = Knight.new(@board.position(coordinate), @board)
    @board.position(coordinate).add_content(@knight)
  end

  def move_knight(destination_coordinates)
    destination_position = @board.position(destination_coordinates)

    return nil unless @knight.valid_move?(destination_position)

    @knight.position.empty_content
    @knight.move(destination_position)
    destination_position.add_content(@knight)
  end
end
