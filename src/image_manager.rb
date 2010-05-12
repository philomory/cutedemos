require 'platform'

module CuteDemos
  NilDraw = Object.new
  def NilDraw.draw(*args); end
  
  class ImageManager
    def self.for(window)
      @managers ||= {}
      @managers[window] ||= self.new(window)
    end
    
    attr_reader :tile_width, :tile_height, :tile_depth, :blank_at_top
    def initialize(window)
      @window = window
      @tile_width, @tile_height, @tile_depth = 100,40,80
      @blank_at_top = 50
      
      @images = {
        :grass => load_image("Grass Block.png"),
        :stone => load_image("Stone Block.png"),
        :space => NilDraw,
        :door  => load_image("Door Tall Closed.png"),
        :window => load_image("Window Tall.png"),
        :dirt  => load_image("Dirt Block.png"),
        :bush  => load_image("Tree Short.png"),
        :water => load_image("Water Block.png"),
        :tree  => load_image("Tree Tall.png"),
        :chest => load_image("Chest Closed.png"),
        :rock  => load_image("Rock.png"),
        :princess => load_image("Character Princess Girl.png"),
        :horn_girl => load_image("Character Horn Girl.png"),
        :pink_girl => load_image("Character Pink Girl.png"),
        :boy => load_image("Character Boy.png"),
        :speech => load_image("SpeechBubble.png"),
        :heart => load_image("Heart.png"),
        :wood  => load_image("Wood Block.png"),
        :wall  => load_image("Wall Block.png"),
        :plain => load_image("Plain Block.png"),
        :brown => load_image("Brown Block.png"),
        :orange_gem => load_image("Gem Orange.png"),
        :chest => load_image("Chest Closed.png")
      }
      @shadows = {
        :north      => load_image("Shadow North.png"),
        :south      => load_image("Shadow South.png"),
        :east       => load_image("Shadow East.png"),
        :west       => load_image("Shadow West.png"),
        :side_west  => load_image("Shadow Side West.png"),
        :north_east => load_image("Shadow North East.png"),
        :north_west => load_image("Shadow North West.png"),
        :south_east => load_image("Shadow South East.png"),
        :south_west => load_image("Shadow South West.png")
      }
      
    end
    
    def [](key)
      @images[key]
    end
    
    def shadow(direction)
      @shadows[direction]
    end
    
    def load_image(name)
      Gosu::Image.new(@window,File.join(Platform::IMAGES_DIR,name),true)
    end
  end
end