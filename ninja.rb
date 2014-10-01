require 'gosu'

NINJA_FALL_SPEED = 720
NINJA_MOVE_SPEED = 240

class Ninja
  attr_accessor :x, :y, :right_pressed, :left_pressed, :animations, :facing
  
  def initialize animations
    self.x = 100
    self.y = 100
    self.animations = animations
    self.facing = :right
  end

  def draw
    if self.facing == :right
      horizontal_scale = 1
    else
      horizontal_scale = -1
    end
    animations.current_image.draw x, y, 1, horizontal_scale
  end

  def update dt
    if right_pressed
      self.x += NINJA_MOVE_SPEED * dt
      self.animations.run_right
      self.facing = :right
    elsif left_pressed
      self.x -= NINJA_MOVE_SPEED * dt
      self.animations.run_left
      self.facing = :left
    else
      self.animations.stand dt
    end

    
    @y += NINJA_FALL_SPEED * dt
    if @y >= 325
      @y = 325
      return
    end

  end
end
