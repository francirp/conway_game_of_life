class Cell

  attr_accessor :x, :y, :state

  module States
    DEAD = :dead
    ALIVE = :alive
    ALL = [DEAD, ALIVE]
  end

  def initialize(args = {})
    @x = args[:x]
    @y = args[:y]
    @state = args[:state] || default_state
  end

  def default_state
    States::DEAD
  end

  def alive?
    state == States::ALIVE
  end

  def dead?
    !alive?
  end

  def to_s
    alive? ? "X" : "-"
  end

  def north
    [x, y + 1]
  end

  def northeast
    [x + 1, y + 1]
  end

  def east
    [x + 1, y]
  end

  def southeast
    [x + 1, y - 1]
  end

  def south
    [x, y - 1]
  end

  def southwest
    [x - 1, y - 1]
  end

  def west
    [x - 1, y]
  end

  def northwest
    [x - 1, y + 1]
  end

end