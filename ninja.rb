require 'gosu'

class Ninja
  def self.create_with_sprite window
    image = Gosu::Image.new(window, "images/ninja/ryu_stand.png", false)
    Ninja.new(image)
  end

  def initialize image
    @image = image
  end

  def sprite
    @image
  end

  def draw
    @image.draw 100, 100, 1
  end

  def update
  end
end
