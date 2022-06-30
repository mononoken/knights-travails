# frozen_string_literal: true

# Represent Knight piece in the game of Chess.
class Knight
  attr_reader :position

  def initialize(position, board = nil)
    @position = position
    @board = board
  end

  def move(destination)
    @position = destination
  end

  def valid_move_positions
    current_coordinate = @position.coordinate
    possible_moves = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
    # Add [2, 1], [1, 2], [-2, -1], [-1,-2], [-2, 1], [1, -2], [2, -1], or [-1, 2] to current position coordinates
    possible_coordinates = possible_moves.map { |move| [current_coordinate[0] + move[0], current_coordinate[1] + move[1]] }
    # Of these coordinates, return the positions with these coordinates that are inside board.positions
    filtered_coordinates = possible_coordinates.filter { |coordinate| @board.positions.any? { |position| position.coordinate == coordinate } }
    # Return array of valid positions for movement
    valid_positions = @board.positions.filter { |position| filtered_coordinates.any?(position.coordinate) }
  end
end
