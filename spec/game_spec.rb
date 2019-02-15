require "./game"

describe "Game runtime" do
  before { @board = Board.new }
  
  it "change the state of a cell by the number from input" do
    allow($stdin).to receive(:gets).and_return(5)
    input = $stdin.gets
    expect(@board.cells[4].state).to eq("X")
  end
end