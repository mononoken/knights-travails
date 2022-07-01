# frozen_string_literal: true

# Represent Knight piece in the game of Chess.
class Knight
  attr_reader :position

  def initialize(position, board = nil)
    @position = position
    @board = board
  end

  def move(destination)
    return nil unless valid_move_positions.any?(destination)

    @position = destination
  end

  def moves(position = @position)
    possible_coordinates(position).map { |coordinate| @board.position(coordinate) }
  end

  def valid_move?(position)
    valid_move_positions.any?(position)
  end

  def possible_moves
    [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
  end

  def possible_coordinates(position = @position)
    possible_coordinates = possible_moves.map do |move|
      [position.coordinate[0] + move[0], position.coordinate[1] + move[1]]
    end

    possible_coordinates.filter do |coordinate|
      @board.positions.any? { |board_position| board_position.coordinate == coordinate }
    end
  end
end
