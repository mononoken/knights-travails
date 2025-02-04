# frozen_string_literal: true

require_relative './board'
require_relative './knight'
require_relative './position'
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

  def knight_moves(start, finish)
    place_knight(start)
    moves = Tree.new(knight, board.position(finish)).find_path(start, finish)
    puts "You made it in #{moves.count} moves! Here's your path:"
    moves.each { |coordinate| p coordinate }
  end
end
