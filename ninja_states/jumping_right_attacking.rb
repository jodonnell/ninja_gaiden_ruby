require './ninja_states/states'
require './ninja_states/falling_right'
require './ninja_states/jumping'
require './ninja_states/jumping_left_attacking'
require './ninja_states/jumping_attacking'

class JumpingRightAttacking < States
  def left
    @ninja.state = JumpingLeftAttacking.new @ninja
  end

  def attack
    @ninja.state = JumpingRightAttacking.new @ninja    
  end
  
  def no_right_or_left
    @ninja.state = JumpingAttacking.new @ninja
  end
  
  def fall
    @ninja.state = FallingRight.new @ninja
  end

  def stop_attacking
    @ninja.state = JumpingRight.new @ninja
  end
  
  def animation
    @ninja.animations.jump_attack
  end

  def update dt
    @ninja.jump dt
    @ninja.move_right dt
    @ninja.attack dt
  end
end
