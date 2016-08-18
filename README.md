# Rover

### Overview
Rover is a simple application inspired from the [traditional  Mars Rover challenge](https://code.google.com/archive/p/marsrovertechchallenge/). In this version the user can enter names of rovers and choose one to drive around a grid, also known as the plateau, filled with obstacles. The user inputs driving commands for the rover they are driving, the other rovers drive themselves randomly. Colliding with obstacles will result in a rover being damaged beyond repair, and is thus removed from the game, the rover who lasts the longest wins. There are a few rules:

1. Rovers cannot be on the same square.
2. Rovers must stay within the grid.
3. Rovers display their name and direction on the grid.
4. Colliding with an obstacle will remove the rover from the game.

### Usage

### Dependancies

Terminal-table is used to generate the ASCII table within the console.

`gem "terminal-table"`

### Personal

In my pursuit to learn Ruby I took this project on to practice my skills. Please feel free to critique my code and offer support.
