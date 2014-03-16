require 'grid'

describe Grid do
  context "initialization" do
    let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' }
    let(:grid) { Grid.new(puzzle) }

    it 'should have 81 cells' do
      expect(grid.cells.length).to eq(81)
    end

    it 'should have an unsolved first cell' do
      expect(grid.cells[0].is_solved?).to be_false
    end

    it 'should have a solved second cell with value 1' do
      expect(grid.cells[1].is_solved?).to be_true
    end

    it 'should parse puzzle into boxes' do
      result = grid.boxes[3].map{|x| x.value }
      expect(result).to eq([4,9,0,5,0,1,0,0,3])
    end

    it 'should parse puzzle into rows' do
      result = grid.rows[3].map{|x| x.value }
      expect(result).to eq([4,9,0,0,0,2,0,1,7])
    end

    it 'should parse puzzle into columns' do
      result = grid.columns[3].map{|x| x.value }
      expect(result).to eq([0,1,0,0,0,9,0,0,2])
    end

    it 'should know that the puzzle is not solved' do
      expect(grid.is_solved?).to be_false
    end

    it 'should solve the puzzle' do
      grid.solve
      result = grid.cells.map{|cell| cell.value}.join
      expect(result).to eq('615493872348127956279568431496832517521746389783915264952681743864379125137254698')
    end
  end

  context "when the puzzle is solved" do
    let(:puzzle) { '615493872348127956279568431496832517521746389783915264952681743864379125137254698' }
    let(:grid) { Grid.new(puzzle) }

    it 'should know the puzzle is solved' do
      expect(grid.is_solved?).to be_true
    end
  end
end