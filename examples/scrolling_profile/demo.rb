dir = File.dirname(__FILE__)
%w{world view}.each {|f| require File.join(dir,f)}

module CuteDemos
  module ScrollingProfile
    def self.view
      ScrollingProfileView
    end
  end
  
  register_demo ScrollingProfile
end