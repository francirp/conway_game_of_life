class Board

  attr_accessor :cells
  attr_reader :width, :height

  DIRECTIONS = %w(north northeast east southeast south southwest west northwest)

  def initialize(args = {})
    @width = args.fetch(:width, 5)
    @height = args.fetch(:height, 5)
    @cells = args[:cells]
  end

  def print
    all = (height - 1).downto(0).map do |y|
      array = width.times.map do |x|
        find_cell(x, y).to_s
      end
      array.join(" ")
    end
    all.each do |row|
      puts row
    end
    return true
  end

  def find_cell(x, y)
    cells.detect {|cell| cell.x == x && cell.y == y }
  end

  def find_neighbors(cell)
    neighbors = DIRECTIONS.map do |direction|
      coordinates = cell.send(direction)
      find_cell(coordinates[0], coordinates[1])
    end.compact
    neighbors
  end



end