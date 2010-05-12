require 'cellgrid'

module CuteDemos
  module SimpleHeightmap
    class Cell < CellGrid::Cell
      attr_accessor :terrain, :height
    end
    class Grid < CellGrid::Grid
      composed_of Cell
    end
    
    TERRAINS = [:grass,:stone,:water]
    HEIGHT = {
      :grass => [0,1],
      :stone => [1,2,3],
      :water => [0]
    }
    
    def self.world
      Grid.new(8,7) do |cell|
        cell.terrain = TERRAINS.sort_by{rand}.first
        cell.height = HEIGHT[cell.terrain].sort_by{rand}.first
      end
    end
  end
end