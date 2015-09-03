class CellGenerator

  attr_reader :width, :height, :living_cell_locations, :number_random_living_cells

  def initialize(args = {})
    @width = args[:width]
    @height = args[:height]
    @number_random_living_cells = args.fetch(:number_random_living_cells, default_random_living_cells)
    @living_cell_locations = args.fetch(:living_cell_locations, generate_living_cell_locations(@number_random_living_cells))
  end

  def default_random_living_cells
    0
  end

  def generate_cells
    new_cells = []
    width.times do |x|
      height.times do |y|
        state = alive?(x, y) ? Cell::States::ALIVE : Cell::States::DEAD
        new_cells << Cell.new(x: x, y: y, state: state)
      end
    end
    new_cells
  end

  def generate_living_cell_locations(num)
    matrix = num.times.map do |i|
      x = rand(0..(width - 1))
      y = rand(0..(height - 1))
      [x, y]
    end
  end

  def alive?(x, y)
    living_cell_locations.include?([x, y])
  end

end