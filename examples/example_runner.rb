require 'gosu'
require 'example_helper'

module CuteDemos
  class DemoWindow < Gosu::Window
    def initialize
      super(800,600,false)
      @needs_redraw = true
      load_demo(5)
    end
    
    def load_demo(i)
      demo = CuteDemos.demo(i)
      if demo
        @model = demo.world
        @controller = demo.respond_to?(:controller) ? demo.controller.new(@model,self) : nil 
        @view = demo.view.new(self,@model,{:draw_shadows=>true})
      end
    end
    
    def draw
      @view.draw_world
      @needs_redraw = false
    end
    
    def needs_redraw?
      @needs_redraw
    end
    
    def button_down(id)
      @needs_redraw = true
      case id
      when Gosu::KbEscape
        close
      else
        char = button_id_to_char(id)
        if char =~ /\d/
          load_demo(char.to_i-1)
        elsif @controller
          @controller.button_down(id)
        else
          # For demos that have not yet got a controller. TODO: Remove!
          case id
          when Gosu::KbLeft
            @model.player_x -= 1 rescue nil
          when Gosu::KbRight
            @model.player_x += 1 rescue nil
          when Gosu::KbUp
            @model.player_y -= 1 rescue nil
          when Gosu::KbDown
            @model.player_y += 1 rescue nil
          end
        end
      end
    end
    
    def update
      if @controller
        @controller.update
        @needs_redraw = true
      end
    end
    
  end
end

#RubyProf.start
CuteDemos::DemoWindow.new.show
#result = RubyProf.stop
#printer = RubyProf::GraphHtmlPrinter.new(result)
#File.open("prof.html",'w') do |f|
#  printer.print(f,{})
#end
#printer.print(STDOUT,{})