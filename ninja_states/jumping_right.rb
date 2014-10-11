require './ninja_states/states'
require './ninja_states/falling_right'
require './ninja_states/jumping'
require './ninja_states/jumping_left'
require './ninja_states/jumping_right_attacking'

class JumpingRight < States
  def left
    @ninja.state = JumpingLeft.new @ninja
  end

  def attack
    @ninja.state = JumpingRightAttacking.new @ninja    
  end

  def stop_attack
    @ninja.state = JumpingRight.new @ninja
  end
  
  def no_right_or_left
    @ninja.state = Jumping.new @ninja
  end
  
  def fall
    @ninja.state = FallingRight.new @ninja
  end
  
  def animation
    @ninja.animations.jump
  end

  def update dt
    @ninja.jump dt
    @ninja.move_right dt
  end
end
