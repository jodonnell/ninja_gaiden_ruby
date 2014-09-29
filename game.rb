require './ninja'
require './stage'

class Game
  attr_accessor :ninja, :stage, :dt

  def initialize window
    @window = window
    @ninja = Ninja.create_with_sprite @window
    @stage = Stage.create_with_sprite @window
    @dt = 0
  end

  def update
    time_since_last = (Gosu::milliseconds - @dt) / 1000.0
    @ninja.update time_since_last
    @dt = Gosu::milliseconds
  end

  def draw
    @stage.draw
    @ninja.draw
  end
end
