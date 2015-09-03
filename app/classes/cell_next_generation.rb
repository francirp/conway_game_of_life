class CellNextGeneration

  attr_reader :cell, :neighbors, :underpopulation_end, :overcrowding_start

  def initialize(args = {})
    @cell = args[:cell]
    @neighbors = args[:neighbors]
    @underpopulation_end = 2
    @overcrowding_start = 4
  end

  def next_state
    cell.alive? ? living_cell_next_state : dead_cell_next_state
  end

  def living_cell_next_state
    return Cell::States::DEAD if underpopulated?
    return Cell::States::ALIVE if appropriately_populated?
    return Cell::States::DEAD
  end

  def dead_cell_next_state
    return Cell::States::ALIVE if number_living_neighbors == 3
    Cell::States::DEAD
  end

  private

    def number_living_neighbors
      @number_living_neighbors ||= neighbors.find_all {|n| n.alive? }.count
    end

    def underpopulated?
      number_living_neighbors < underpopulation_end
    end

    def appropriately_populated?
      number_living_neighbors < overcrowding_start
    end

end