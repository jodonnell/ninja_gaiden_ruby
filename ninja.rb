require 'gosu'
NINJA_FALL_SPEED = 720

class Ninja
  attr_accessor :y
  
  def self.create_with_sprite window
    image = Gosu::Image.new(window, "images/ninja/ryu_stand.png", false)
    Ninja.new(image)
  end

  def initialize image
    @image = image
    @y = 100
  end

  def sprite
    @image
  end

  def draw
    @image.draw 100, @y, 1
  end

  def update dt
    @y += NINJA_FALL_SPEED * dt
  end
end
