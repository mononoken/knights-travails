# frozen_string_literal: true

# Position that represents a square on a Chess board.
class Position
  def initialize(coordinates, content = nil)
    @coordinates = coordinates
    @content = content
  end
end
