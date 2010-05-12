require 'cute_view'

module CuteDemos
  module SimpleProfile
    class SimpleProfileView < CuteView
      
      def [](x,y,z)
        world[x,y]
      end
      
      def world_depth
        1
      end
      
      def invert_depth?
        true
      end
      
      def invert_vertical?
        true
      end
      
    end
  end
end