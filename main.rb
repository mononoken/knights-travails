# frozen_string_literal: true

require_relative './lib/game'

test = Game.new
puts 'Test[0,0] to [1,2]'
test.knight_moves([0,0],[1,2]) == [[0,0],[1,2]]
puts 'Test [0,0] to [3,3]'
test.knight_moves([0,0],[3,3]) == [[0,0],[1,2],[3,3]]
puts 'Test [3,3] to [0,0]'
test.knight_moves([3,3],[0,0]) == [[3,3],[1,2],[0,0]]
