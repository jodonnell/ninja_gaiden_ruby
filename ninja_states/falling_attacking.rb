require './ninja_states/states'
require './ninja_states/falling_right'
require './ninja_states/falling_attacking'
require './ninja_states/jumping'
require './ninja_states/jumping_left_attacking'
require './ninja_states/jumping_attacking'

class FallingAttacking < States
  def left
    @ninja.state = FallingLeftAttacking.new @ninja
  end

  def right
    @ninja.state = FallingRightAttacking.new @ninja
  end

  def fall
    @ninja.state = FallingAttacking.new @ninja
  end

  def stop_attacking
    @ninja.state = Falling.new @ninja
  end
  
  def animation
    @ninja.animations.jump_attack
  end

  def update dt
    @ninja.fall dt
    @ninja.attack dt
  end
end
