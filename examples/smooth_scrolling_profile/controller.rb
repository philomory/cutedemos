module CuteDemos
  module SmoothScrollingProfile
    class SmoothScrollingProfileController
      def initialize(world,window)
        @window = window
        @world = world
        @player = world.player
      end

      def update
        move_x = 0
        move_x -= 0.05 if @window.button_down? Gosu::KbLeft
        move_x += 0.05 if @window.button_down? Gosu::KbRight
        @player.update(move_x)
      end

      def button_down(id)
        if id == Gosu::KbUp
          @player.try_to_jump
        end
      end

    end
  end
end