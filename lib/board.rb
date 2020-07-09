require './lib/cell'

class Board
  attr_reader :cells

  def initialize
    @cells = {
     "A1" => Cell.new("A1"),
     "A2" => Cell.new("A2"),
     "A3" => Cell.new("A3"),
     "A4" => Cell.new("A4"),
     "B1" => Cell.new("B1"),
     "B2" => Cell.new("B2"),
     "B3" => Cell.new("B3"),
     "B4" => Cell.new("B4"),
     "C1" => Cell.new("C1"),
     "C2" => Cell.new("C2"),
     "C3" => Cell.new("C3"),
     "C4" => Cell.new("C4"),
     "D1" => Cell.new("D1"),
     "D2" => Cell.new("D2"),
     "D3" => Cell.new("D3"),
     "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include?(coordinate)
  end

  def coordinates_consecutive?(coordinates)
    letters = []
    numbers = []
    coordinates.each do |coordinate|
      letters << coordinate.slice(0)
      numbers << coordinate.slice(1).to_i
    end
    if letters.uniq.count == 1  && (numbers.sort == numbers)
      (numbers[0]..numbers[-1]).to_a == numbers
    elsif numbers.uniq.count == 1 && (letters.sort == letters)
      (letters[0]..letters[-1]).to_a == letters
    else
      false
    end
  end

  def valid_coordinate_length?(ship, coordinates)
    ship.length == coordinates.count
  end

  def valid_placement?(ship, coordinates)
    if valid_coordinate?(coordinates) &&
    coordinates_consecutive?(coordinates) &&  valid_coordinate_length?(ship, coordinates) && @cell.empty?
      true
    else
      false
    end
  end


end
