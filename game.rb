require './ninja'

class Game
  def initialize window
    @window = window
    @ninja = Ninja.create_with_sprite @window
  end

  def update
  end

  def draw
    @ninja.draw
  end
end
