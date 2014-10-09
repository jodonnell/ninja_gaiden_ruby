require 'gosu'
require './game'

class Window < Gosu::Window
  def initialize
    super(Gosu::screen_width, Gosu::screen_height, false)
    self.caption = "Gosu Tutorial Game"
    @game = Game.new(self)
  end

  def update
    @game.ninja.right_pressed = (button_down? Gosu::KbRight or button_down? Gosu::GpRight)
    @game.ninja.left_pressed = (button_down? Gosu::KbLeft or button_down? Gosu::GpLeft)

    if @game.ninja.can_jump? and button_down? Gosu::KbX or button_down? Gosu::GpButton1
      @game.ninja.jump_pressed = true
    end
    @game.update
  end

  def draw
    @game.draw
  end
end

window = Window.new
window.show
