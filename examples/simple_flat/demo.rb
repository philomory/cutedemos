dir = File.dirname(__FILE__)
%w{world view}.each {|f| require File.join(dir,f)}

module CuteDemos
  module SimpleFlat
    def self.view
      SimpleFlatView
    end
  end
  
  register_demo SimpleFlat
end