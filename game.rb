class Cell
  attr_accessor :id, :row, :column, :diagonal, :state

  def initialize(id)
    @id = id
    @state = id.to_s

    @row = 'top'    if id == 1 || id == 2 || id == 3
    @row = 'middle' if id == 4 || id == 5 || id == 6
    @row = 'bottom' if id == 7 || id == 8 || id == 9

    @column = 'left'     if id == 1 || id == 4 || id == 7
    @column = 'center'   if id == 2 || id == 5 || id == 8
    @column = 'right'    if id == 3 || id == 6 || id == 9

    @diagonal = 'north-east'  if id == 1 || id == 9
    @diagonal = 'north-west'  if id == 7 || id == 3
    @diagonal = 'special'     if id == 5

  end

end

class Board
  attr_accessor :cells

  def initialize
    @cells = []
    for i in (1..9) do
      cell = Cell.new(i)
      @cells << cell
    end
  end

  def output
    for cell in @cells
      print cell.state + " "
      puts "" if cell.column == "right"
    end
  end
end

board = Board.new
# board.cells.each {|cell| puts "cell no#{cell.id} is in the #{cell.row} row, and #{cell.column} column"}

loop do
  board.output

  puts "Player 1, choose a number of an empty cell"
  input_p1 = gets.chomp.to_i

  board.cells[input_p1 - 1].state = "x"

end
