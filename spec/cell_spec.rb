require 'cell'

describe Cell do
  context "a cell knows it's locations" do
    it "should know it's row" do
      expect(Cell.new(0,0).row).to eq(0)
      expect(Cell.new(0,8).row).to eq(0)
      expect(Cell.new(0,9).row).to eq(1)
      expect(Cell.new(0,26).row).to eq(2)
      expect(Cell.new(0,27).row).to eq(3)
      expect(Cell.new(0,73).row).to eq(8)
    end

    it "should know it's column" do
      expect(Cell.new(0,0).column).to eq(0)
      expect(Cell.new(0,8).column).to eq(8)
      expect(Cell.new(0,9).column).to eq(0)
      expect(Cell.new(0,27).column).to eq(0)
      expect(Cell.new(0,28).column).to eq(1)
      expect(Cell.new(0,73).column).to eq(1)
    end

    it "should know it's box" do
      expect(Cell.new(0,0).box).to eq(0)
      expect(Cell.new(0,1).box).to eq(0)
      expect(Cell.new(0,9).box).to eq(0)
      expect(Cell.new(0,6).box).to eq(2)
    end
  end

  context "can solve using neighbours" do
    it "should solve the cell" do
      cell =  Cell.new(0,0)
      cell.solve(
        [Cell.new(6,0),Cell.new(7,0),Cell.new(8,0)] + 
        [Cell.new(1,0),Cell.new(2,0),Cell.new(3,0)] + 
        [Cell.new(4,0),Cell.new(5,0)])
      expect(cell.value).to eq(9)
    end
    it "should return possibilities when trying to solve" do
      result = Cell.new(0,0).solve(
        [Cell.new(7,0),Cell.new(8,0)] + 
        [Cell.new(1,0),Cell.new(2,0),Cell.new(3,0)] + 
        [Cell.new(4,0),Cell.new(5,0)])
      expect(result).to eq([6,9])
    end
  end
end