require 'ruby-debug'
require 'set'

$LOAD_PATH << File.join(File.dirname(File.dirname(__FILE__)),'src')

module CuteDemos
  def self.register_demo(demo)
    @demos ||= Set.new([])
    @demos << demo
  end
  def self.demo(i)
    @demos.to_a[i]
  end
end

%w{simple_flat scrolling_flat simple_heightmap simple_profile scrolling_profile}.each do |dir|
  require File.join(dir,'demo')
end