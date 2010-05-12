require 'gosu'
require 'example_helper'

module CuteDemos
  class DemoWindow < Gosu::Window
    def initialize
      super(800,600,false)
      @needs_redraw = true
      load_demo(0)
    end
    
    def load_demo(i)
      demo = CuteDemos.demo(i)
      if demo
        @model = demo.world
        @view = demo.view.new(self,@model)
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
      # Only doing this directly in the model because I haven't implimented controllers yet. TODO: Remove!
      when Gosu::KbLeft
        @model.player_x -= 1 rescue nil
      when Gosu::KbRight
        @model.player_x += 1 rescue nil
      when Gosu::KbUp
        @model.player_y -= 1 rescue nil
      when Gosu::KbDown
        @model.player_y += 1 rescue nil
      else
        char = button_id_to_char(id)
        if char =~ /\d/
          load_demo(char.to_i-1)
        end
      end
    end
    
  end
end

CuteDemos::DemoWindow.new.show