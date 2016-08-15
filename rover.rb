require 'terminal-table'

class NavigateRover

  GRID_SIZE = 5

  class << self

    def welcome
      puts "Welcome to the Rover game!"
    end

    def add_rovers
      puts "Please enter the name(s) of your rover(s):"
      rovers = Array.new
        loop do
          rover_name = gets.chomp
          break if rover_name == "done"
          create_rover = Rover.create(rover_name)
          rovers.push(create_rover)
        end
        return rovers
    end

    def select_rover(rovers)
      loop do
        puts "What rover would you like to drive?"
        driving_rover = gets.chomp
        index = rovers.index { |rover| rover.name == driving_rover }
        if driving_rover == "exit"
          break
        elsif index == nil
          puts "That is not a rover, please enter the name of a valid rover."
        else
          drive_rover(rovers[index])
        end
      end
    end

    def drive_rover(rover)
      loop do
        puts "Enter the commands to drive #{rover.name} (up/down/left/right/exit):"
        command = gets.chomp
        if command == "exit"
          break
        elsif command == "switch"
          break
        else
          rover.drive(command)
          print_grid(rover)
        end
      end
    end

    def print_grid(rovers)
      puts rovers.inspect
      rover_row = Array.new
      normal_row = Array.new
        GRID_SIZE.times do |row_num|
          if row_num+1 == rovers.location[:x]
            rover_row.push("#{rovers.name} (#{rovers.direction})")
            normal_row.push(" ")
          else
            rover_row.push(" ")
            normal_row.push(" ")
          end
        end
        table = Terminal::Table.new do |t|
        GRID_SIZE.times do |col_num|
          if col_num+1 == (rovers.location[:y])
            t.add_row(rover_row)
          else
            t.add_row(normal_row)
          end
          t.add_separator if col_num < GRID_SIZE-1
        end
      end
      puts table
    end

      # Run the application
    def run
      welcome
      select_rover(add_rovers)
      loop do
        drive_rover
      end
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
    puts projected
    if (projected <= NavigateRover::GRID_SIZE ) && (projected >= 1)
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
  attr_accessor :name, :location, :direction

  def initialize(name, location={x: rand(1..NavigateRover::GRID_SIZE), y: rand(1..NavigateRover::GRID_SIZE)}, direction="s")
    @name = name
    @location = location
    @direction = direction
  end
end

NavigateRover.run
