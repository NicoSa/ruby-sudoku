require_relative 'cell'

class Grid 
  attr_accessor :cells

  def initialize(puzzle)
    @cells = puzzle.chars.map.with_index{|cell, index| 
      Cell.new(cell.to_i, index)
    };
  end
  
  def boxes
    @cells.group_by{|cell| cell.box}
  end

  def rows
    @cells.group_by{|cell| cell.row}
  end

  def columns
    @cells.group_by{|cell| cell.column}
  end

  def is_solved?
    @cells.all?{ |cell| cell.is_solved? } 
  end


  def unsolved_count
    @cells.count{ |cell| !cell.is_solved? } 
  end

  def solve
    solving_cells = true
    while solving_cells && is_solved? == false
      for cell in @cells
        possibilities = rows[cell.row] + columns[cell.column] + boxes[cell.box]
        cell.solve(possibilities)
      end
      solving_cells = unsolved_count != unsolved_count_before ||= 0
      unsolved_count_before = unsolved_count
    end
  end
end