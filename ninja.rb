require 'gosu'

NINJA_FALL_SPEED = 720
NINJA_MOVE_SPEED = 240

class Ninja
  attr_accessor :x, :y, :right_pressed, :left_pressed, :animations, :facing, :jump_pressed
  
  def initialize animations
    self.x = 100
    self.y = 100
    self.animations = animations
    self.facing = :right
    @normal_width = animations.current_image.width
  end

  def draw
    draw_x = x
    if self.facing == :right
      horizontal_scale = 1
    else
      horizontal_scale = -1
      width = animations.current_image.width
      draw_x += width - get_offset(width)
    end
    animations.current_image.draw draw_x, y, 1, horizontal_scale
  end

  def update dt
    if jump_pressed
    end      
    if right_pressed
      self.x += NINJA_MOVE_SPEED * dt
      self.animations.run_right
      self.facing = :right
    elsif left_pressed
      self.x -= NINJA_MOVE_SPEED * dt
      self.animations.run_left
      self.facing = :left
    else
      self.animations.stand
    end

    
    @y += NINJA_FALL_SPEED * dt
    if @y >= 325
      @y = 325
      return
    end
  end

  private
  def get_offset image_width
    offset = 0
    if image_width > @normal_width
      offset = image_width - @normal_width
    end
    offset
  end
end
