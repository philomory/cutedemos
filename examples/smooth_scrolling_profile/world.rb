module CuteDemos
  module SmoothScrollingProfile
    class World
      KEYS = {
        '#' => :grass,
        '.' => nil,
        '*' => :orange_gem,
        ']' => :chest
      }
      attr_reader :height, :width, :player
      def initialize(arrays)
        @arrays = arrays
        @height = arrays.length
        @width = arrays[0].length
        @player = Player.new(self,0,@height-2)
      end
      
      def player_x
        @player.x
      end
      
      def player_y
        @player.y
      end
      
      def [](x,y)
        if x.between?(0,@width) && y.between?(0,@height)
          KEYS[@arrays[y][x]] rescue nil
        else
          nil
        end
      end
    end
    
    class Player
      attr_reader :x, :y
      def initialize(world,x,y)
        @world = world
        @x, @y = x, y
        @vy = 0
        @dx = 0
      end
      
      def update(move_x)
        @x += move_x
        @vy += 0.05
        @vy = 0 if (@vy > 0 && @world[@x.round,(@y+@vy)+0.95]) || (@vy < 0 && @world[@x.round,(@y+@vy).floor])
        @y += @vy
      end
      
      def try_to_jump
        @vy = -0.7 if @world[@x.ceil,(@y.floor + 1)] || @world[@x.floor,(@y.floor + 1)] 
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