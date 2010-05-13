dir = File.dirname(__FILE__)
%w{world view controller}.each {|f| require File.join(dir,f)}

module CuteDemos
  module SmoothScrollingProfile
    def self.view
      SmoothScrollingProfileView
    end
    
    def self.controller
      SmoothScrollingProfileController
    end
  end
  
  register_demo SmoothScrollingProfile
end