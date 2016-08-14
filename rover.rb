

class NavigateRover
  GRID_SIZE = 20

  def self.run
    loop do
      puts "Welcome to the Rover Game!"
      puts "Please enter the name(s) of your rover(s): (done)"
      rover_names = Array.new
      loop do
        rover = gets.chomp
        break if rover == "done"
        rover_names.push(rover)
      end
      rovers = Array.new
      rover_names.each do |rover_name|
        rover = Rover.create(rover_name)
        rovers.push(rover)
      end
      loop do
        puts "What rover would you like to drive?"
        driving_rover = gets.chomp
        if driving_rover == "exit"
          break
        end
          loop do
            puts "Enter the commands to drive #{driving_rover} (forward/reverse/left/right/switch/exit):"
            command = gets.chomp
            if command == "exit"
              break
            elsif command == "switch"
              break
            else
              rovers[index(driving_rover)].drive(command)
            end
      end
    end
      puts Rover.instances.inspect
      break
    end
  end
end

module Rovers

  def self.included(base)
    base.extend(RoversClassMethods)
  end

  #Instance Methods
  def drive(type)
    case type
    when "left","l"
      perform_maneuver(:x,"-")
    when "right","r"
      perform_maneuver(:x,"+")
    when "forward","f"
      perform_maneuver(:y,"+")
    when "reverse","re"
      perform_maneuver(:y,"-")
    else
      puts "This drive command is not supported."
    end
  end

  def perform_maneuver(key,direction)
    if @location[key] < NavigateRover::GRID_SIZE
      if direction == "+"
        @location[key] += 1
      else
        @location[key] -= 1
      end
    else
      puts "Grid restriction, cannot move here."
    end
  end

  module RoversClassMethods
    def create(name="Mars Rover")
      object = new(name)
      instances.push(object)
      return object
    end
    def instances
      @instances ||= []
    end
  end
end

class Rover
  include Rovers
  attr_accessor :name, :location

  def initialize(name, start_location={x: 0, y: 0})
    @name = name
    @location = start_location
  end
end

NavigateRover.run
