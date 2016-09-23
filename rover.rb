require "./grid_item"

class Rover
  include GridItem

  attr_accessor :name, :location, :direction, :lives

  #Initialization
  def initialize(name="Mars Robert", location={x: rand(0..App::GRID_SIZE-1), y: rand(0..App::GRID_SIZE-1)}, direction="s", lives=2)
    @name = name
    @location = location
    @direction = direction
    @lives = lives
  end

  #Instance Methods
  def drive(type,rover)
    case type
      when "left","l"
        perform_maneuver(:x,"-","w",rover)
      when "right","r"
        perform_maneuver(:x,"+","e",rover)
      when "up","u"
        perform_maneuver(:y,"-","n",rover)
      when "down","d"
        perform_maneuver(:y,"+","s",rover)
    else
      puts "This drive command is not supported."
    end
  end

  def perform_maneuver(key,movement,direction,rover)
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
    if ((projected < App::GRID_SIZE) && (projected >= 0))
      if movement == "+"
        @location[key] += 1
      else
        @location[key] -= 1
      end
      @direction = direction
    else
      puts "Grid restriction, cannot move here. (#{rover.name}) "
    end
  end

  def is_another_rover_at_location?(rover)
    Rover.instances.each do |rover_checking|
      if rover_checking == rover
        return true
      end
    end
    return false
  end
end
