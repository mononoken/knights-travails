# frozen_string_literal: true

require_relative './node'
require_relative './knight'

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
    # Seems #moves may not belong with Knight
    leaf.children = knight.moves(leaf.position).map { |position| Node.new(position) }
  end

  def expand_tree(positions = preorder(root))
    # loop through all elements of tree
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
