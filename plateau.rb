require 'terminal-table'

# Defines the surface the rovers and obstacles are on
class Plateau

  class << self
  # Prints the grid to the screen given the rovers and obstacle objects
  def print_grid(rover)
    rover_row = Array.new
    normal_row = Array.new
      App::GRID_SIZE.times do |row_num|
        if row_num+1 == rover.location[:x]
          rover_row.push("#{rover.name} (#{rover.direction})")
          normal_row.push(" ")
        else
          rover_row.push(" ")
          normal_row.push(" ")
        end
      end
      table = Terminal::Table.new do |t|
      App::GRID_SIZE.times do |col_num|
        if col_num+1 == (rover.location[:y])
          t.add_row(rover_row)
        else
          t.add_row(normal_row)
        end
        t.add_separator if col_num < App::GRID_SIZE-1
      end
    end
    puts table
  end
  end
end
