require './ninja_states/states'
require './ninja_states/falling_left'
require './ninja_states/jumping'
require './ninja_states/jumping_right'

class JumpingLeft < States
  def right
    @ninja.state = JumpingRight.new @ninja
  end

  def attack
    @ninja.state = JumpingLeftAttacking.new @ninja    
  end

  def stop_attack
    @ninja.state = JumpingLeft.new @ninja
  end

  def no_right_or_left
    @ninja.state = Jumping.new @ninja
  end
  
  def fall
    @ninja.state = FallingLeft.new @ninja
  end

  def animation
    @ninja.animations.jump
  end

  def update dt
    @ninja.jump dt
    @ninja.move_left dt
  end
  
end
