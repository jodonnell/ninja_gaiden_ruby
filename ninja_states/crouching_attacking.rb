require './ninja_states/states'
require './ninja_states/running_right'
require './ninja_states/running_left'
require './ninja_states/jumping'
require './ninja_states/attacking'
require './ninja_states/crouching_attacking'

class CrouchingAttacking < States
  def right
    @ninja.state = RunningRight.new @ninja
  end

  def left
    @ninja.state = RunningLeft.new @ninja
  end

  def jump
    @ninja.state = Jumping.new @ninja
  end

  def stop_attacking
    @ninja.state = Crouching.new @ninja
  end

  
  def animation
    @ninja.animations.crouch_attacking
  end

  def update dt
    @ninja.attack dt
  end

end
