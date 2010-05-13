require 'cute_view'

module CuteDemos
  module ScrollingFlat
    class ScrollingFlatView < CuteView

      def world_height
        1
      end

      def world_depth
        world.height
      end

      def [](x,y,z)
        world[x,z].terrain
      end

      def draw_partial?
        true
      end

      def center_on
        {:x=>world.player_x,:z=>world.player_y}
      end
      
      def draw
        draw_block(:pink_girl,world.player_x,1,world.player_y)
      end    

    end
  end
end