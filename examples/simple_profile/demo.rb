dir = File.dirname(__FILE__)
%w{world view}.each {|f| require File.join(dir,f)}

module CuteDemos
  module SimpleProfile
    def self.view
      SimpleProfileView
    end
  end
  
  register_demo SimpleProfile
end