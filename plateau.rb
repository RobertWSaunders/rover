require 'terminal-table'

# Defines the surface the rovers and obstacles are on
class Plateau

  class << self
    # Prints the grid to the screen given the rovers and obstacle objects
    def print_grid(grid_items)

    plateau = Terminal::Table.new do |t|
          App::GRID_SIZE.times do |y_value|
            t.add_row(get_row_for_y(grid_items,y_value))
            t.add_separator if y_value < App::GRID_SIZE-1
          end
      end
      #Put the plateau out to the screen
      puts plateau
    end


    def get_row_for_y(grid_items, y_value)
      all_grid_items = grid_items[:rovers]
      #all_grid_items.push(grid_items[:obstacles])
      grid_item_row = Array.new
      App::GRID_SIZE.times do |x_value|
          all_grid_items.each do |grid_item|
            if (grid_item.location[:x] == x_value) && (grid_item.location[:y] == y_value)
              if grid_item.class == Rover
                grid_item_row.push("#{grid_item.name} (#{grid_item.direction})")
              elsif grid_item.class == Obstacle
                grid_item_row.push("X")
              end
            elsif (grid_item.location[:y] == y_value)
                grid_item_row.push(" ")
            end
          end
      end
      return grid_item_row
    end


  end
end
