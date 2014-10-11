require './camera_aware_image'

class Stage
  attr_accessor :image

  def self.create_with_sprite window
    image = CameraAwareImage.new(window, "images/level_test.png", false)
    Stage.new(image)
  end

  def initialize image
    @image = image
  end

  def draw
    @image.draw 0, 0, 1
  end
end
