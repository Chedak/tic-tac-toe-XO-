# Classes
class Cell
  attr_accessor :id, :state

  def initialize(id)
    @id = id
    @state = id.to_s
  end

end

class Board
  attr_accessor :cells, :lines

  def initialize
    @cells = []
    for i in (1..9) do
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

  def output
    @cells.each do |cell|
      print cell.state + " "
      puts "" if cell.id % 3 == 0
    end
  end

  def check_state
    x_won = @lines.any? do |line|
              line.each {|cell| cell.state == 'x'}
            end
    # puts x_won
  end
end

board = Board.new
loop do
  board.output

  puts "Player 1, choose a number of an empty cell"
  input_p1 = gets.chomp.to_i
  board.cells[input_p1 - 1].state = "x"
  puts board.lines[:left][0].state
  # board.check_state

  # board.output
  # puts "Player 2, choose a number of an empty cell"
  # input_p2 = gets.chomp.to_i
  # board.cells[input_p2 - 1].state = "o"
  # board.check_state
end
