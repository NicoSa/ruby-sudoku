class Cell
  attr_accessor :value
  attr_accessor :row
  attr_accessor :column
  attr_accessor :box

  COLUMN_SIZE = 9
  BOX_SIZE = Math.sqrt(COLUMN_SIZE).to_i

  def initialize(value, index)
    @value = value
    @row = (index / COLUMN_SIZE)
    @column = index % COLUMN_SIZE
    @box = BOX_SIZE * (@row/BOX_SIZE) + (@column/BOX_SIZE)
  end

  def is_solved?
    @value != 0
  end

  def solve(neighbours)
    return if is_solved?

    possibilities = (1..COLUMN_SIZE).to_a - neighbours.map{|cell| cell.value}
    if possibilities.length == 1
      @value = possibilities[0]
    end
    possibilities
  end

end
