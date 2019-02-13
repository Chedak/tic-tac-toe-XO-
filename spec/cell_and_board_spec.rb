require "./cell_and_board"

RSpec.describe Cell do
  it "initialized with a given id" do
    id = 5
    cell = Cell.new(id)
    expect(cell.id).to eql(id)
  end
end
