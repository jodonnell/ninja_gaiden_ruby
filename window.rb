require 'gosu'
require './game'

class Window < Gosu::Window
  def initialize
    super(Gosu::screen_width, Gosu::screen_height, true)
    self.caption = "Gosu Tutorial Game"

    @game = Game.new(self)
  end

  def update
    @game.update
  end

  def draw
    @game.draw
  end
end

window = Window.new
window.show
