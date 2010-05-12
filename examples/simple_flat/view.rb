require 'cute_view'

module CuteDemos
  module SimpleFlat
    class SimpleFlatView < CuteView
      def world_height
        1
      end
      
      def world_depth
        world.height
      end
      
      def [](x,y,z)
        world[x,z].terrain
      end
      
    end
  end
end