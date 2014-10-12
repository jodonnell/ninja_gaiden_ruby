require 'gosu'
require './camera'

class CameraAwareImage < Gosu::Image
  def draw *args
    camera = Camera.instance
    args[0] -= camera.x
    args[1] -= camera.y
    super *args
  end
end
