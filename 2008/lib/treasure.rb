class TreasureMap

  attr_accessor :pos

  def initialize
    @pos = [0, 0]
  end

  def feed input
    steps, dir = input.split
    case dir
    when "N" then @pos[1] += steps.to_i
    when "S" then @pos[1] -= steps.to_i
    when "E" then @pos[0] += steps.to_i
    when "W" then @pos[0] -= steps.to_i
    end
    @pos
  end

  def distance
    x, y = @pos
    Math.sqrt(x*x + y*y).round(3)
  end
end