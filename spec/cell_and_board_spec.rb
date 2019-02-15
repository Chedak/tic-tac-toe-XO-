require "./cell_and_board"

RSpec.describe Cell do
  it "initialized with a given id" do
    id = 5
    cell = Cell.new(id)
    expect(cell.id).to eql(id)
  end
end

RSpec.describe Board do
  describe "#check_state" do
    it "sets game_finished attribute to true when someone wins" do
      current_player = "X"
      board = Board.new
      board.cells[0].state = current_player
      board.cells[1].state = current_player
      board.cells[2].state = current_player
      board.check_state(current_player)

      expect(board.game_finished).to eq(true)

    end

    it "sets game_finished attribute to true when someone wins" do
      current_player = "X"
      board = Board.new
      board.cells[0].state = current_player
      board.cells[3].state = current_player
      board.cells[2].state = current_player
      board.check_state(current_player)

      expect(board.game_finished).to eq(false)

    end

    it "sets game_finished attribute to true when someone wins" do
      current_player = "X"
      board = Board.new
      board.cells[0].state = current_player
      board.cells[3].state = current_player
      board.cells[6].state = current_player
      board.check_state(current_player)

      expect(board.game_finished).to eq(true)

    end

    it "sets game_finished attribute to true when someone wins" do
      current_player = "O"
      board = Board.new
      board.cells[0].state = current_player
      board.cells[4].state = current_player
      board.cells[8].state = current_player
      board.check_state(current_player)

      expect(board.game_finished).to eq(true)

    end

    it "sets game_finished attribute to true when someone wins" do
      current_player = "O"
      board = Board.new
      board.cells[0].state = current_player
      board.cells[4].state = current_player
      board.cells[7].state = current_player
      board.check_state(current_player)

      expect(board.game_finished).to eq(false)

    end
  end

  #The following method is commented out for us to understand how test cases impact software development processes (https://stackoverflow.com/questions/6208249/is-there-a-way-to-check-internal-method-variables-with-rspec)
  #describe "#check_state victory condition" do
    #it "sets all_occupied attribute to true when all cells are occupied!" do
      #current_player = "X"
      #previous_player = "O"
      #board = Board.new
      #board.cells[0].state = current_player
      #board.cells[1].state = previous_player
      #board.cells[2].state = current_player
      #board.cells[3].state = previous_player
      #board.cells[4].state = current_player
      #board.cells[5].state = previous_player
      #board.cells[6].state = previous_player
      #board.cells[7].state = current_player
      #board.cells[8].state = current_player
      #board.check_state(current_player)

      #expect(board.game_finished).to eq(all_occupied)

    #end
  #end
end
