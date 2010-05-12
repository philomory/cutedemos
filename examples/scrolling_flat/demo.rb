dir = File.dirname(__FILE__)
%w{world view}.each {|f| require File.join(dir,f)}

module CuteDemos
  module ScrollingFlat
    def self.view
      ScrollingFlatView
    end
  end
  
  register_demo ScrollingFlat
end