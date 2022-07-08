# frozen_string_literal: true

# Node for use in a binary search tree (BST)
class Node
  attr_accessor :position, :children

  # How to make sure argument is a specific type?
  # data is an instance of Position
  def initialize(position = nil, children = [])
    @position = position
    @children = children
  end

  def leaf?
    children.empty?
  end
end
