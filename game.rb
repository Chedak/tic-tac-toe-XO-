class Cell
  attr_accessor :id, :state

  def initialize(id)
    @id = id
  end

end

class Board
  attr_accessor :cells, :lines, :game_finished

  def initialize
    @cells = []
    1.upto 9 do |i|
      cell = Cell.new(i)
      @cells << cell
    end

    @lines = {
      top:    @cells[0..2],
      middle: @cells[3..5],
      bottom: @cells[6..8],
      left:   [@cells[0],@cells[3],@cells[6]],
      center: [@cells[1],@cells[4],@cells[7]],
      right:  [@cells[2],@cells[5],@cells[8]],
      north_east: [@cells[0],@cells[4],@cells[8]],
      north_west: [@cells[2],@cells[4],@cells[6]],
    }
  end

  def output_board
    puts "====="
    @cells.each do |cell|
      print cell.state || cell.id
      print " "
      puts "" if cell.id % 3 == 0
    end
    puts "====="
  end

  def check_state(current_player)
    won = @lines.any? do |key, line|
              line.all? {|cell| cell.state == current_player}
            end
    all_occupied = @cells.all? {|cell| cell.state}
    
    self.game_finished = won || all_occupied

    if won
      puts "Player -#{current_player}- won!"
    elsif all_occupied
      puts "Draw!"
    end
  end
end

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
