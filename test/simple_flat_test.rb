require 'test_helper'

class SimpleFlatViewTest < Test::Unit::TestCase
  class TestModelCell < CellGrid::Cell
    attr_accessor :key
  end
  class TestModelGrid < CellGrid::Grid
    composed_of TestModelCell
  end
  class TestView < CuteDemos::CuteView
    def world_height
      1
    end
    def world_depth
      world.height
    end
    def [](x,y,z)
      world[x,z].key
    end

    def draw_shadows?
      false
    end
  end
  
  def test_view_renders_all_tiles_when_they_all_fit
    model = TestModelGrid.new(2,2) {|cell| cell.key = :grass }
    window = TestWindow.new(600,600,model,TestView)
    
    window.do_tick
    assert_equal 4, window.drawing_events.length
    
  end
  
  def test_view_renders_only_tiles_that_fit
    model = TestModelGrid.new(50,50) {|cell| cell.key = :grass }
    window = TestWindow.new(640,500,model,TestView)
    
    window.do_tick
    assert_equal 36, window.drawing_events.length
  end
  
  
end