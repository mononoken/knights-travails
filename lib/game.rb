# frozen_string_literal: true

require_relative './board'
require_relative './knight'
require_relative './position'

# Delete?
require_relative './tree'

# Represent a game of chess.
class Game
  attr_reader :board, :knight

  def initialize
    @board = Board.new
    @knight = nil
  end

  def place_knight(coordinate)
    remove_knight unless @knight.nil?

    @knight = Knight.new(@board.position(coordinate), @board)
    @board.position(coordinate).add_content(@knight)
  end

  def remove_knight
    # What is safe navigation? Look up when we have internet connection.
    @knight.position.empty_content unless @knight.nil?
    @knight = nil
  end

  def move_knight(destination_coordinates)
    destination_position = @board.position(destination_coordinates)

    return nil unless @knight.valid_move?(destination_position)

    @knight.position.empty_content
    @knight.move(destination_position)
    destination_position.add_content(@knight)
  end

  # DON'T PANIC. STACK OVERFLOW.
  # Need to bring over Node and Tree class
  # Tree class should be more than just binary
  # Every 'round' check if any of the paths hvae reached finish.
  # If yes, return that path
  # If no, build tree off of these paths

  # Faith recommended running two trees starting from start and finish
  # Would have to compare each node against the other tree to see if any nodes match
  # (this would be the midpoint)
  # Search for midpoint would resemble array2.filter { |num| array1.any?(num) }
  def knight_moves(start, finish)
    place_knight(start)
    Tree.new(knight.position, board.position(finish))
  end
end
