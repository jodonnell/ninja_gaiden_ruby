require './ninja_states/states'
require './ninja_states/running_right'
require './ninja_states/running_left'
require './ninja_states/jumping'
require './ninja_states/attacking'
require './ninja_states/crouching_attacking'

class Crouching < States
  def right
    @ninja.state = RunningRight.new @ninja
  end

  def left
    @ninja.state = RunningLeft.new @ninja
  end

  def jump
    @ninja.state = Jumping.new @ninja
  end

  def attack
    @ninja.state = CrouchingAttacking.new @ninja
  end

  def stop_crouching
    @ninja.state = Standing.new @ninja
  end
  
  def animation
    @ninja.animations.crouch
  end
end
