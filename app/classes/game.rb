class Game

  attr_reader :width, :height, :board

  def initialize(args = {})
    ask_for_width
    ask_for_height
    @board = args[:board] || Board.new(cells: ask_for_initial_cells, width: width, height: height)
  end

  def iterative(num = 10)
    board.print
    num.times do |i|
      puts nil
      puts nil
      next_generation
      board.print
    end
  end

  def next_generation
    @board = CreateNextGeneration.new(current_board: board).next_board
  end

  def ask_for_initial_cells
    CellGenerator.new({ width: width, height: height }.merge(living_cell_settings)).generate_cells
  end

  def ask_for_width
    puts "What is the width of the board?"
    @width = gets.chomp.to_i
  end

  def ask_for_height
    puts "What is the height of the board?"
    @height = gets.chomp.to_i
  end

  def living_cell_settings
    use_coordinates = ask_how_to_setup_living_cells
    use_coordinates == "y" ? { living_cell_locations: ask_for_coordinates } : { number_random_living_cells: ask_for_number_random_living_cells }
  end

  def ask_how_to_setup_living_cells
    puts "Would you like to specify the coordinates of the starting living cells? (y / n)"
    gets.chomp
  end

  def ask_for_coordinates
    puts "What are the coordinates of the living cells? i.e. (x-axis,y-axis) (x-axis,y-axis) ...something like: (0,1) (1,4)"
    response = gets.chomp
    locations_coordinates = response.split.map do |coordinate_string|
      coordinates = coordinate_string.gsub("(", "").gsub(")", "").split(",").map(&:to_i)
    end
    binding.pry
    locations_coordinates
  end

  def ask_for_number_random_living_cells
    puts "How many random living cells should we start with?"
    gets.chomp.to_i
  end

end