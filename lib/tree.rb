# frozen_string_literal: true

require_relative './node'
require_relative './knight'

# Tree of moves to find shortest path from knight's current position to desired last_position.
class Tree
  attr_reader :knight, :root

  def initialize(knight, last_position = nil)
    @knight = knight
    @root = Node.new(knight.position)
    build_tree(root, last_position)
  end

  def build_tree(first_position = root, last_position = nil)
    grow_leaf(first_position)
    expand_tree until preorder.any? { |node| node.position == last_position }
    root
  end

  def grow_leaf(leaf)
    leaf.children = knight.moves(leaf.position).map { |position| Node.new(position) }
  end

  def expand_tree(positions = preorder(root))
    positions.each { |position| grow_leaf(position) if position.leaf? }
  end

  def preorder(pointer = root, preorder_list = [], &block)
    if pointer.nil?
      nil
    else
      block.call pointer if block_given?
      preorder_list.push(pointer)

      pointer.children.each { |child| preorder(child, preorder_list, &block) }

      preorder_list
    end
  end

  def find_path(start, finish)
    path = [finish]
    until path.any?(start)
      next_nodes = preorder.filter do |node|
        node.children.any? { |child| child.position.coordinate == path[0] }
      end
      next_coordinate = next_nodes[0].position.coordinate
      path.unshift(next_coordinate) unless next_coordinate.empty?
    end
    path
  end

  def find_midpoint(start, finish)
    # start.children = build_tree(start)
    # finish.children = build_tree(finish)
    # if midpoint = find_shared(start_moves, finish_moves).nil?
    #   find_midpoint(start.children, finish.children)
    # else
    #   return midpoint
    # end
  end

  def find_shared(array, other_array)
    shared = array.filter { |item| other_array.any?(item) }
    if shared.empty?
      nil
    else
      shared
    end
  end
end
