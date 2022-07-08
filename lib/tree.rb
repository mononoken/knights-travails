# frozen_string_literal: true

require_relative './node'
require_relative './knight'

class Tree
  attr_reader :knight, :root

  def initialize(knight, last_position = nil)
    @knight = knight
    @root = build_tree(knight.position, last_position)
  end

  def build_tree(first_position, last_position = nil)
    start_tree(first_position)
    # until tree.include?(last_position)
    # expand_tree
  end

  def start_tree(position)
    Node.new(position, knight.moves(position).map { |next_position| Node.new(next_position) })
    # moves from Knight
  end

  def expand_tree(tree = nil)
    # loop through all elements of tree
    if node.leaf?
      # Find children/moves of each child and link to node
    end
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
