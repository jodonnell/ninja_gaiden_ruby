require './ninja'
require './ninja_animations'
require './stage'
require './camera'

class Game
  attr_accessor :ninja, :stage, :dt, :camera

  def initialize window
    @window = window
    animations = NinjaAnimations.new @window
    @ninja = Ninja.new animations
    @stage = Stage.create_with_sprite @window
    @dt = 0
    @camera = Camera.instance
    @camera.ninja = @ninja
    
  end

  def update
    time_since_last = (Gosu::milliseconds - @dt) / 1000.0
    @ninja.update time_since_last
    @dt = Gosu::milliseconds
    camera.update
  end

  def draw
    @stage.draw
    @ninja.draw
  end
end
