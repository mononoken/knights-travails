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
    @knight&.position&.empty_content
  end

  def move_knight(destination_coordinates)
    destination_position = @board.position(destination_coordinates)

    return nil unless @knight.valid_move?(destination_position)

    @knight.position.empty_content
    @knight.move(destination_position)
    destination_position.add_content(@knight)
  end

  def knight_moves(start, finish)
    place_knight(start)
    moves = Tree.new(knight, board.position(finish)).find_path(start, finish)
    puts "You made it in #{moves.count} moves! Here's your path:"
    moves.each { |coordinate| p coordinate }
  end
end

test = Game.new
puts 'Test[0,0] to [1,2]'
test.knight_moves([0,0],[1,2]) == [[0,0],[1,2]]
puts 'Test [0,0] to [3,3]'
test.knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]
puts 'Test [3,3] to [0,0]'
test.knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]
