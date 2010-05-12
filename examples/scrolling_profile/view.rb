require 'cute_view'

module CuteDemos
  module ScrollingProfile
    class ScrollingProfileView < CuteView
      
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
      
      def center_on
        {:x => world.player_x}
      end
      
      def draw
        draw_block(:pink_girl,world.player_x,world.player_y,0)
      end
    end
  end
end