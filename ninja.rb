require 'gosu'
require './ninja_states/standing'
require './ninja_states/falling'

NINJA_FALL_SPEED = 720
NINJA_MOVE_SPEED = 240

class Ninja
  attr_accessor :x, :y, :animations, :facing, :state
  
  def initialize animations
    self.x = 100
    self.y = 100
    self.animations = animations
    self.facing = :right
    @normal_width = animations.current_image.width
    @state = Falling.new self
  end

  def draw
    draw_x = x
    draw_y = y
    if self.facing == :right
      horizontal_scale = 1
    else
      horizontal_scale = -1
      width = animations.current_image.width
      draw_x += width - get_offset(width)
    end

    if self.state.is_a?(Crouching) or self.state.is_a?(CrouchingAttacking)
      draw_y += 20
    end
    
    animations.current_image.draw draw_x, draw_y, 1, horizontal_scale
  end

  def update dt
    #puts @state
    @state.update dt
    @state.animation
  end

  def move_right dt
    self.facing = :right
    @x += NINJA_MOVE_SPEED * dt
  end

  def move_left dt
    self.facing = :left
    @x -= NINJA_MOVE_SPEED * dt
  end

  def try_jumping
    @state.jump
  end

  def try_running_right
    @state.right
  end
  
  def try_running_left
    @state.left
  end

  def try_standing_still
    @state.no_right_or_left
  end
  
  def try_attacking
    @state.attack
  end

  def try_crouching
    @state.crouch
  end

  def stop_crouching
    @state.stop_crouching
  end

  def attack dt
    @attack_timer = 0 if @attack_timer.nil?

    @attack_timer += dt
    if @attack_timer > 0.5
      @attack_timer = 0
      @state.stop_attacking
    end
  end
  
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
      @state.fall
      @timer = 0
      return
    end
  end
  
  def fall dt
    @y += NINJA_FALL_SPEED * dt
    if @y >= 325
      @y = 325
      @state = Standing.new self
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
