require './cell_and_board'

board = Board.new
board.output_board

counter = 1
loop do
  current_player = counter.odd? ? "X" : "O"

  puts "Player -#{current_player}-, please choose a number of an empty cell"
  input = gets.chomp.to_i

  unless input.between?(1, 9)
    puts "Only integers between 1 - 9 allowed"
    redo
  end

  if board.cells[input - 1].state
    puts "Oops, this cell is occupied!"
    redo
  end

  board.cells[input - 1].state = current_player
  board.output_board
  board.check_state(current_player)

  if board.game_finished
    puts "Game over"
    break
  end

  counter += 1
end
