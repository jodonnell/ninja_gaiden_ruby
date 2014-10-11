require './ninja_states/states'
require './ninja_states/falling_right'
require './ninja_states/falling_attacking'
require './ninja_states/jumping'
require './ninja_states/jumping_left_attacking'
require './ninja_states/jumping_attacking'

class JumpingAttacking < States
  def left
    @ninja.state = JumpingLeftAttacking.new @ninja
  end

  def right
    @ninja.state = JumpingRightAttacking.new @ninja
  end

  def fall
    @ninja.state = FallingAttacking.new @ninja
  end

  def stop_attacking
    @ninja.state = Jumping.new @ninja
  end
  
  def animation
    @ninja.animations.jump_attack
  end

  def update dt
    @ninja.jump dt
    @ninja.attack dt
  end
end
