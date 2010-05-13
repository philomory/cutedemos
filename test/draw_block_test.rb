require 'test_helper'

class DrawBlockTest < Test::Unit::TestCase
  class DrawBlockTestWindow < Gosu::Window
    attr_reader :view
    def initialize
      super(400,400,false)
      @view = CuteDemos::CuteView.new(self,nil)
    end
  end
  
  def setup
    @window = DrawBlockTestWindow.new
    @image_manager = CuteDemos::ImageManager.for(@window)
  end
  
  def test_block_is_drawn
    @window.view.draw_block(:grass,0,0,0,false)
    assert_equal @image_manager[:grass], @window.drawing_events.first.content
  end
  
  def test_block_horizontal_coordinate_changes_only_x_axis_placement
    @window.view.draw_block(:grass,0,0,0,false)
    @window.view.draw_block(:stone,1,0,0,false)
    
    grass = @image_manager[:grass].drawing_events.first.options
    stone = @image_manager[:stone].drawing_events.first.options
    
    assert_not_equal grass[:x], stone[:x]
    assert_equal grass[:y], stone[:y]
    assert_equal grass[:z], stone[:z]
  end
  
  def test_only_block_horizontal_coordinate_changes_x_axis_placement
    @window.view.draw_block(:grass,0,1,2,false)
    @window.view.draw_block(:stone,0,3,4,false)
    
    grass = @image_manager[:grass].drawing_events.first.options
    stone = @image_manager[:stone].drawing_events.first.options
    
    assert_equal grass[:x], stone[:x]
  end
  
  def test_blocks_with_higher_vertical_coordinate_are_higher_on_y_axis
    @window.view.draw_block(:grass,0,0,0,false)
    @window.view.draw_block(:stone,0,1,0,false)
    
    grass = @image_manager[:grass].drawing_events.first.options
    stone = @image_manager[:stone].drawing_events.first.options
    
    assert grass[:y] > stone[:y] # larger y value means farther down screen in Gosu
  end
    
  def test_blocks_with_higher_vertical_coordinate_get_greater_z_value
    @window.view.draw_block(:grass,0,0,0,false)
    @window.view.draw_block(:stone,0,1,0,false)
    
    grass = @image_manager[:grass].drawing_events.first.options
    stone = @image_manager[:stone].drawing_events.first.options
    
    assert grass[:z] < stone[:z]
  end
  
  def test_blocks_with_higher_depth_coordinate_are_lower_on_y_axis
    @window.view.draw_block(:grass,0,0,0,false)
    @window.view.draw_block(:stone,0,0,1,false)
    
    grass = @image_manager[:grass].drawing_events.first.options
    stone = @image_manager[:stone].drawing_events.first.options
    
    assert grass[:y] < stone[:y] # larger y value means farther down screen in Gosu
  end
  
  def test_blocks_with_higher_depth_coordinate_get_greater_z_value
    @window.view.draw_block(:grass,0,0,0,false)
    @window.view.draw_block(:stone,0,0,1,false)
    
    grass = @image_manager[:grass].drawing_events.first.options
    stone = @image_manager[:stone].drawing_events.first.options
    
    assert grass[:z] < stone[:z]
  end
  
  def test_depth_coordinate_trumps_vertical_coordinate_for_z_value
    @window.view.draw_block(:grass,0,1,0,false)
    @window.view.draw_block(:stone,0,0,1,false)
    
    grass = @image_manager[:grass].drawing_events.first.options
    stone = @image_manager[:stone].drawing_events.first.options
    
    assert grass[:z] < stone[:z]
  end

end