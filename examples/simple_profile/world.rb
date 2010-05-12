module CuteDemos
  module SimpleProfile
    class World
      KEYS = {
        '#' => :dirt,
        '.' => nil,
        '*' => :orange_gem,
        'O' => :plain
      }
      attr_reader :height, :width
      def initialize(arrays)
        @arrays = arrays
        @height = arrays.length
        @width = arrays[0].length
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
        %w{# # # # # # # #},
        %w{# . . . . . . #},
        %w{# . . . . . . #},
        %w{# . . . . . . #},
        %w{# . . . . . . #},
        %w{# . . * . * . #},
        %w{# . . . . . . #},
        %w{# . . . . . . #},
        %w{# . * . * . . #},
        %w{# . O O O O . #},
        %w{# . . . . . . #},
        %w{# . . . . . . #},
        %w{# . . . . . . #},
        %w{# . . . . . . #},
        %w{# # # # # # # #},
      ]
      )
    end
  end
end