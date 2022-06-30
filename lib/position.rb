# frozen_string_literal: true

# Position that represents a square on a Chess board.
class Position
  attr_reader :coordinates, :content

  def initialize(coordinates, content = nil)
    @coordinates = coordinates
    @content = content
  end

  def add_content(content)
    return nil unless @content.nil?

    @content = content
  end
end
