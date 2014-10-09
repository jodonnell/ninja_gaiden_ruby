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
      jump dt
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

    fall dt if falling?
  end

  def can_jump?
    !falling?
  end
  
  private

  def jump dt
    @timer = 0 if @timer.nil?

    @timer += dt
    if @timer <= 0.22
      @y -= 480 * dt
    elsif @timer <= 0.27
      @y -= 360 * dt
    elsif @timer <= 0.32
      @y -= 240 * dt
    elsif @timer <= 0.37
      @y -= 120 * dt
    elsif @timer <= 0.47
    else
      @timer = 0
      self.jump_pressed = false
      #self.ninja.animations:fall()
      return
    end
    #self.ninja.animations:jump()
    #self.y -= 10
  end

  def falling?
    !jump_pressed && @y < 325
  end
  
  def fall dt
    @y += NINJA_FALL_SPEED * dt
    if @y >= 325
      @y = 325
    end
  end
  
  def get_offset image_width
    offset = 0
    if image_width > @normal_width
      offset = image_width - @normal_width
    end
    offset
  end
end
