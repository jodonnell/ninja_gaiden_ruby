require './ninja_states/states'
require './ninja_states/falling_right'
require './ninja_states/jumping'
require './ninja_states/jumping_left'
require './ninja_states/jumping_right_attacking'
require './ninja_states/falling_right_attacking'

class FallingLeftAttacking < States
  def right
    @ninja.state = FallingRightAttacking.new @ninja
  end

  def no_right_or_left
    @ninja.state = FallingAttacking.new @ninja
  end
  
  def stop_attacking
    @ninja.state = FallingLeft.new @ninja
  end
  
  def animation
    @ninja.animations.jump_attack
  end

  def update dt
    @ninja.fall dt
    @ninja.move_left dt
    @ninja.attack dt
  end
end
