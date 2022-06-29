# frozen_string_literal: true

# 8x8 board for playing Chess.
class Board
  attr_reader :array

  def initialize
    @array = create_board
    # Create array of coordinates
  end

  def create_board
    array = Array.new
    x = 0
    y = 0

    loop do
      if x == 7 && y == 7
        array.push([x,y])
        break
      end

      array.push([x, y])
      if y == 7
        x += 1
        y = 0
      else
        y += 1
      end
    end
    array
  end
end
