# frozen_string_literal: true

# Represent Knight piece in the game of Chess.
class Knight
  attr_reader :position

  def initialize(position)
    @position = position
  end

  def move(destination)
    @position = destination
  end

  def valid_moves
    current_coord = @position.coordinates
    possible_moves = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
    possible_coords = possible_moves.map { |move| [current_coord[0] + move[0], current_coord[1] + move[1]] }
    # Add [2, 1], [1, 2], [-2, -1], [-1,-2], [-2, 1], [1, -2], [2, -1], or [-1, 2] to current position coordinates
    # Of these coordinates, return the positions with these coordinates that are inside board.positions
    # Return array of valid positions for movement
  end
end
