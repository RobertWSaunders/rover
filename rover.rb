GRID_SIZE = 20

class NavigateRover

  def self.run
    loop do
      puts "Welcome to the Rover Game!"
      puts "Please enter the name of your rover:"
      rover_name = gets.chomp
      rover = Rover.create(rover_name)
      loop do
        puts "Enter the commands to drive (forward/reverse/left/right/exit):"
        command = gets.chomp
        if command == "exit"
          break
        else
          rover.drive(command)
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
    when "left"
      @location[:x] -= 1 if @location[:x] <= 20
    when "right"
      @location[:x] += 1 if @location[:x] <= 20
    when "forward"
      @location[:y] += 1 if @location[:y] <= 20
    when "reverse"
      @location[:y] -= 1 if @location[:y] <= 20
    else
      puts "This drive command is not supported."
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
