class CreateNextGeneration

  attr_reader :current_board, :next_board

  def initialize(args = {})
    @current_board = args[:current_board]
    @next_board = build_next_board
  end

  def build_next_board
    new_cells = current_board.cells.map do |cell|
      new_cell = cell.dup
      neighbors = current_board.find_neighbors(cell)
      next_state = CellNextGeneration.new(neighbors: neighbors, cell: cell).next_state
      new_cell.state = next_state
      new_cell
    end
    Board.new(width: current_board.width, height: current_board.height, cells: new_cells)
  end

end