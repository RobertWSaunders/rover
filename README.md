# Rover

## Overview

Rover is a simple application inspired from the [traditional  Mars Rover challenge](https://code.google.com/archive/p/marsrovertechchallenge/). In this version the user can enter names of rovers and choose one to drive around a grid, also known as the plateau, filled with obstacles. The user inputs driving commands for the rover they are driving, the other rovers drive themselves randomly. Colliding with obstacles will result in a rover being damaged beyond repair, and is thus removed from the game, the rover who lasts the longest wins. There are a few rules:

1. Rovers cannot be on the same square.
2. Rovers must stay within the grid.
3. Rovers display their name and direction on the grid.
4. Colliding with an obstacle will remove the rover from the game.

## Usage

To play Rover download all of the files and save them to a directory.

Open Terminal and enter the following command:

`$ ruby app.rb`

## Dependancies

Terminal-table is used to generate the ASCII table within the console.

`$ gem "terminal-table"`

### Personal

I took this project on for fun and to help practice my Ruby skills. Please feel free to critique my code and offer support. Shout out to Fabio Gelsomini for giving me the inspiration for this project. 
