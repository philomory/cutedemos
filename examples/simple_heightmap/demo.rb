dir = File.dirname(__FILE__)
%w{world view}.each {|f| require File.join(dir,f)}

module CuteDemos
  module SimpleHeightmap
    def self.view
      SimpleHeightmapView
    end
  end
  
  register_demo SimpleHeightmap
end