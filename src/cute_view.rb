require 'image_manager'
require 'shadows'

module CuteDemos
  class CuteView    
    include Shadows
    attr_reader :world, :image_manager, :tiles_high, :tiles_wide, :tiles_deep
    def initialize(window,world,options = {})
      @window, @world = window, world
      @image_manager = ImageManager.for(window)
      @width, @height = @window.width, @window.height
      @scale = options[:scale] || 1.0
      @tile_width = @image_manager.tile_width * @scale
      @tile_height = @image_manager.tile_height * @scale
      @tile_depth = @image_manager.tile_depth * @scale
      @top_margin = @image_manager.blank_at_top * @scale
      @max_width = (@window.width / @tile_width).floor
      @max_height = (@window.height / @tile_height).floor
      @max_depth = (@window.height / @tile_depth).floor
      @tiles_wide = [@max_width, world_width].min
      @tiles_high = [@max_height, world_height].min
      @tiles_deep = [@max_depth, world_depth].min
       
    end
    
    def draw_block(key, horizontal_coord, vertical_coord, depth_coord,draw_shadows = true)
      x,y,z = *screen_coordinates(horizontal_coord-horizontal_offset,vertical_coord,depth_coord-depth_offset)
      image_manager[key].draw(x,y,z,@scale,@scale)
      draw_shadows(horizontal_coord,vertical_coord,depth_coord) if draw_shadows
    end
  
    def draw_world
      tiles_high.floor.times do |y|
        y += height_offset
        tiles_deep.floor.times do |z|
          z += depth_offset
          tiles_wide.floor.times do |x|
            x += horizontal_offset
            key = marked?(x,y,z) ? :heart : self[x,y,z]
            draw_block(key,x,y,z) if key
          end
        end
      end
      self.draw
    end
    
    def center_on
      {}
    end
    
    def horizontal_offset
      if center_on[:x]
        [[0,(center_on[:x] - tiles_wide/2).floor].max,world_width-tiles_wide].min
      else
        0
      end
    end
    
    def height_offset
      if center_on[:y]
        [[0,(center_on[:y] - tiles_high/2).floor].max,world_height-tiles_high].min
      else
        0
      end
    end
    
    def depth_offset
      if center_on[:z]
        [[0,(center_on[:z] - tiles_deep/2).floor].max,world_depth-tiles_deep].min
      else
        0
      end
    end
  
    def draw; end
  
    def world_width
      world.width rescue 1000000
    end
    
    def world_height
      world.height rescue 1000000
    end
    
    def world_depth
      world.depth rescue 1000000
    end
  
    def get_block(h,v,d)
      if h.between?(0,world_width-1) && v.between?(0,world_height-1) && d.between?(0,world_depth-1)
        self[h,v,d]
      else
        nil
      end
    end
  
    def handle_input(x,y,z)
      @marked = [x,y,z]
    end
    
    def marked?(x,y,z)
      @marked == [x,y,z]
    end
    
    def invert_depth?
      false
    end
    def invert_vertical?
      false
    end
    def invert_horizontal?
      false
    end
    
    private
    
    
    
    def screen_coordinates(horizontal_coord,vertical_coord,depth_coord)
      depth_coord = @max_depth - depth_coord - 1 if invert_depth?
      vertical_coord = @tiles_high - vertical_coord - 1 if invert_vertical?

      x = horizontal_coord * @tile_width
      y = (depth_coord * @tile_depth) - (vertical_coord * @tile_height) - @top_margin 
      z = depth_coord + (1 - (1.0/(vertical_coord + (@tiles_high * 2))))
      [x,y,z]
    end
=begin
    def determine_dimensions(o)
      if o[:scale] && o[:size_in_pixels] && o[:size_in_tiles]
        raise(ArgumentError,"Cannot have all three of scale, dimensions in pixels and dimensions in tiles. Choose two.")
      else
        if o[:scale] 
          @scale = o[scale]
        if o[:size_in_pixels]
          @width, @height = *(o[:size_in_pixels])
        elsif o[:size_in_tiles]
          @tiles_wide, @tiles_high = *(o[:size_in_tiles])
        end
        if @scale
          @width  ||= @tiles_wide ? (@tiles_wide * @scale) : @window.width
          @height ||= @tiles_high ? (@tiles_high * @scale) : @window.height
          @tiles_wide ||= @width / @scale
          @tiles_high ||= @height / @scale
        elsif @width
          
          
      else
        if o 
        
          
    end
=end
    
    
  end
end