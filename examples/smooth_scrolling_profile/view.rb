require 'cute_view'
require 'ruby-prof'

module CuteDemos
  module SmoothScrollingProfile
    class SmoothScrollingProfileView < CuteView
      
      def [](x,y,z)
        z == 0 ? world[x,y] : nil rescue nil
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
      
      def smooth_scroll?
        true
      end
      
      def center_on
        {:x => world.player_x}
      end
      
      def draw
        image_manager.image(:sky).draw(0,0,0)
        draw_block(:pink_girl,world.player_x,world.player_y,0,false)
      end
    end
  end
end