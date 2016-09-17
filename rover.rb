require "./grid_item"

class Rover
  include GridItem

  attr_accessor :name, :location, :direction, :lives

  #Initialization
  def initialize(name="Mars Rover", location={x: rand(1..App::GRID_SIZE),y: rand(1..App::GRID_SIZE)}, direction="s", lives=2)
    @name = name
    @location = location
    @direction = direction
    @lives = lives
  end

  #Instance Methods
  def drive(type)
    case type
    when "left","l"
      perform_maneuver(:x,"-","w")
    when "right","r"
      perform_maneuver(:x,"+","e")
    when "up","u"
      perform_maneuver(:y,"-","n")
    when "down","d"
      perform_maneuver(:y,"+","s")
    else
      puts "This drive command is not supported."
    end
  end

  def perform_maneuver(key,movement,direction)
    if ["n","s"].include?(direction)
      if movement == "-"
        projected = @location[:y] - 1
      else
        projected = @location[:y] + 1
      end
    else
      if movement == "-"
        projected = @location[:x] - 1
      else
        projected = @location[:x] + 1
      end
    end
    if (projected <= App::GRID_SIZE) && (projected >= 1)
      if movement == "+"
        @location[key] += 1
      else
        @location[key] -= 1
      end
      @direction = direction
    else
      puts "Grid restriction, cannot move here."
    end
  end
end
