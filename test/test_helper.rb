require 'test/unit'
require 'mocha'
$LOAD_PATH << File.join((File.dirname(File.dirname(File.dirname(__FILE__)))),'gosu-mock')
require 'gosu_mock'

$LOAD_PATH << File.join(File.dirname(File.dirname(__FILE__)),'src')
require 'cute_view'

class TestWindow < Gosu::Window
  def initialize(h,w,model,view_klass)
    super(h,w,false)
    @model = model
    @view = view_klass.new(self,@model)
  end
  
  def draw
    @view.draw_world
  end
end


require 'cellgrid'

