require 'cellgrid'

module CuteDemos
  module SimpleFlat
    class Cell < CellGrid::Cell
      attr_accessor :terrain
    end
    class Grid < CellGrid::Grid
      composed_of Cell
    end
    
    TERRAINS = [:grass,:stone,:wood,:water,:plain,:brown]
      
    def self.world
      Grid.new(8,7) do |cell|
        cell.terrain = TERRAINS[rand(TERRAINS.size)]
      end
    end
  end
end