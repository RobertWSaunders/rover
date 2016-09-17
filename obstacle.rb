require "./grid_item"

# Defines an obatacle
class Obstacle
  include GridItem
  attr_accessor :name, :location, :kind

  def intialize(name="Ob", location={x: rand(1..App::GRID_SIZE), y: rand(1..App::GRID_SIZE)}, kind="Rock")
    @name = name
    @location = location
    @kind = kind
  end

end
