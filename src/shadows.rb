require 'set'

module CuteDemos
  module Shadows
    SHADOW_CASTERS = Set.new([:dirt,:stone,:grass,:water,:plain,:brown,:wood,:wall])
    
    def shadow_directions(x,y,z)
      h = invert_horizontal? ? -1 : 1
      v = invert_vertical?   ? -1 : 1
      d = invert_depth?      ? -1 : 1
      dirs = []
      dirs << :north      if casts_shadow?(x  ,y+v,z-d)
      dirs << :south      if casts_shadow?(x  ,y+v,z+d)
      dirs << :east       if casts_shadow?(x+h,y+v,z  )
      dirs << :west       if casts_shadow?(x-h,y+v,z  )
      dirs << :side_west  if casts_shadow?(x-h,y  ,z+d)
      dirs << :south_east if casts_shadow?(x+h,y+v,z+d) and !casts_shadow?(x+h,y+v,z)
      dirs << :south_west if casts_shadow?(x-h,y+v,z+d) and !casts_shadow?(x-h,y+v,z)
      dirs << :north_east if casts_shadow?(x+h,y+v,z-d) and !casts_shadow?(x+h,y+v,z) and !casts_shadow?(x,y+v,z-d)
      dirs << :north_west if casts_shadow?(x-h,y+v,z-d) and !casts_shadow?(x-h,y+v,z) and !casts_shadow?(x,y+v,z-d)
      dirs
    end
    
    def draw_shadows(h,v,d)
      x,y,z = *screen_coordinates(h-horizontal_offset,v,d-depth_offset)
      shadow_directions(h,v,d).each do |dir|
        image_manager.shadow(dir).draw(x,y,z,@scale,@scale)
      end
    end
    
    #TODO: rethink handling shadows cast by off-screen blocks
    def casts_shadow?(x,y,z)
      SHADOW_CASTERS.include?(get_block(x,y,z))
    end
    
  end
end