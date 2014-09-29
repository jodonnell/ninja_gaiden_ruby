require 'gosu'
NINJA_FALL_SPEED = 720
NINJA_MOVE_SPEED = 240

class Ninja
  attr_accessor :x, :y, :right_pressed, :left_pressed
  
  def self.create_with_sprite window
    image = Gosu::Image.new(window, "images/ninja/ryu_stand.png", false)
    Ninja.new(image)
  end

  def initialize image
    @image = image
    self.x = 100
    self.y = 100
  end

  def sprite
    @image
  end

  def draw
    @image.draw x, y, 1
  end

  def update dt
    if right_pressed
      self.x += NINJA_MOVE_SPEED * dt
    end

    if left_pressed
      self.x -= NINJA_MOVE_SPEED * dt
    end

    
    @y += NINJA_FALL_SPEED * dt
    if @y >= 325
      @y = 325
      return
    end

  end
end
