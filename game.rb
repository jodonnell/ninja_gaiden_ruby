require './ninja'
require './stage'

class Game
  attr_accessor :ninja, :stage

  def initialize window
    @window = window
    @ninja = Ninja.create_with_sprite @window
    @stage = Stage.create_with_sprite @window
  end

  def update
  end

  def draw
    @stage.draw
    @ninja.draw
  end
end
