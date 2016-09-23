require "./rover"
require "./obstacle"
require "./plateau"
# Why do files just know where constants are?
class App

  GRID_SIZE = 5

  class << self

    def welcome
      puts "Welcome to the Rover game!"
    end

    def add_rovers
      puts "Please enter the name(s) of your rover(s):"
        loop do
          rover_name = gets.chomp
          break if rover_name == "done"
          Rover.create(rover_name)
          puts Rover.instances.inspect
        end
    end

    def select_rover
      loop do
        puts "What rover would you like to drive?"
        driving_rover = gets.chomp
        index = Rover.instances.index { |rover| rover.name == driving_rover }
        if driving_rover == "exit"
          break
        elsif index == nil
          puts "That is not a rover, please enter the name of a valid rover."
        else
          drive_rover(Rover.instances[index])
        end
      end
    end

    def generate_obstacles
      puts "Would ypu like any obstacles to make this game harder for you? (y/n)"
      answer = gets.chomp
      if answer == "y"
        puts "How many?"
        number_of_obstacles = gets.chomp
        # have to compute if the amount of obstacles the user chooses is acceptable on the grid size.
        number_of_obstacles.to_i.times { Obstacle.create("test") }

      end
      puts Obstacle.instances
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
          Plateau.print_grid({ rovers: Rover.instances, obstacles: Obstacle.instances })
        end
      end
    end

    def drive_other_rovers_randomly(selected_rover)
      Rover.instances.each do |rover|
        rover.drive(["u","d","l","r"].sample,rover) if !(rover.name == selected_rover.name)
      end
    end

      # Run the application
    def run
      welcome
      add_rovers
      generate_obstacles
      select_rover
    end
  end

end

App.run
