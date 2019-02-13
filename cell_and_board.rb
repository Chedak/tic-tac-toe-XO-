class Cell
  attr_accessor :id, :state

  def initialize(id)
    @id = id
  end

end

class Board
  attr_accessor :cells, :lines, :game_finished

  def initialize
    @cells = (1..9).map { |i| Cell.new(i) }

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
    @cells.each_slice(3) do |row|
      row.each do |cell|
        print "#{cell.state || cell.id} "
      end
      puts ""
    end
    puts "====="
  end

  def check_state(current_player)
    won = @lines.any? do |key, line|
              line.all? {|cell| cell.state == current_player}
            end
    all_occupied = @cells.all?(&:state)

    self.game_finished = won || all_occupied

    if won
      puts "Player -#{current_player}- won!"
    elsif all_occupied
      puts "Draw!"
    end
  end
end
