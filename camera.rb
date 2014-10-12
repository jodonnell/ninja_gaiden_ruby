require 'singleton'

class Camera
  include Singleton

  attr_accessor :x, :y, :ninja

  def initialize
    self.x = 0
    self.y = 0
  end

  def update
    self.x = ninja.x - Gosu::screen_height / 2
    self.y = ninja.x - Gosu::screen_width / 2
  end
end
