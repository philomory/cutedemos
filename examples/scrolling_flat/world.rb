require 'cellgrid'

module CuteDemos
  module ScrollingFlat
    class Cell < CellGrid::Cell
      attr_accessor :terrain
    end
    class Grid < CellGrid::Grid
      composed_of Cell
      attr_accessor :player_x, :player_y
    end
    
    TERRAINS = [:grass,:stone,:wood,:water,:plain,:brown]
      
    def self.world
      grid = Grid.new(30,30) do |cell|
        cell.terrain = TERRAINS[rand(TERRAINS.size)]
      end
      grid.player_x = 5
      grid.player_y = 5
      grid
    end
  end
end