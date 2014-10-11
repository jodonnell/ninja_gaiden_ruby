require 'gosu'
require './game'

class Window < Gosu::Window
  def initialize
    super(Gosu::screen_width, Gosu::screen_height, false)
    self.caption = "Gosu Tutorial Game"
    @game = Game.new(self)
  end

  def update
    right = (button_down? Gosu::KbRight or button_down? Gosu::GpRight)
    left = (button_down? Gosu::KbLeft or button_down? Gosu::GpLeft)
    if right
      @game.ninja.try_running_right
    end

    if left
      @game.ninja.try_running_left
    end

    if not right and not left
      @game.ninja.try_standing_still
    end
    
    
    if button_down? Gosu::KbX or button_down? Gosu::GpButton1
      @game.ninja.try_jumping
    end

    if button_down? Gosu::KbZ or button_down? Gosu::GpButton2
      @game.ninja.try_attacking
    end

    @game.update
  end

  def draw
    @game.draw
  end
end

window = Window.new
window.show
