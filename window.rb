require 'gosu'
require './game'

class Window < Gosu::Window
  def initialize
    super(Gosu::screen_width, Gosu::screen_height, false)
    self.caption = "Gosu Tutorial Game"
    @game = Game.new(self)
  end

  def update
    if button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @game.ninja.right_pressed = true
    else
      @game.ninja.right_pressed = false
    end

    @game.update
  end

  def draw
    @game.draw
  end
end

window = Window.new
window.show
