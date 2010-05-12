require 'cute_view'

module CuteDemos
  module SimpleHeightmap
    class SimpleHeightmapView < CuteView
      
      def world_height
        4
      end
      
      def world_depth
        world.height
      end
          
      def [](x,y,z)
        cell = world[x,z]
        cell.height >= y ? cell.terrain : nil
      end
    end
  end
end