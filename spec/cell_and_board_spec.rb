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
      
    end
  end
end
