module CuteDemos
  module ScrollingProfile
    class World
      KEYS = {
        '#' => :grass,
        '.' => nil,
        '*' => :orange_gem,
        ']' => :chest
      }
      attr_reader :height, :width
      attr_accessor :player_x, :player_y
      def initialize(arrays)
        @arrays = arrays
        @height = arrays.length
        @width = arrays[0].length
        @player_x, @player_y = 0,1
      end
      def [](x,y)
        if x.between?(0,@width) && y.between?(0,@height)
          KEYS[@arrays[y][x]] rescue nil
        else
          nil
        end
      end
    end

    def self.world
      World.new(
      [
        %w{. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .},
        %w{. . . . . . . . . . * . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .},
        %w{. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .},
        %w{. . . . . . . . . * . * . . . . . . . . . . . . . . . . . . . . . . . . . ] . . . . .},
        %w{. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . # # # # # . . .},
        %w{. . . . . . . # # # # # # . . . . . . . . . . . . . . . . . . . . . # # # # # # # . .},
        %w{. . . . . . # # # # # # # # . . . . . . . . . . . . . . . . . . . # # # # # # # # # .},
        %w{# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #},
      ]
      )
    end
  end
end