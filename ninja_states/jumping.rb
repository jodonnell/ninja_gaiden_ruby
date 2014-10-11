require './ninja_states/states'
require './ninja_states/falling_left'
require './ninja_states/jumping'
require './ninja_states/jumping_attacking'

class Jumping < States
  def right
    @ninja.state = JumpingRight.new @ninja
  end

  def left
    @ninja.state = JumpingLeft.new @ninja
  end

  def attack
    @ninja.state = JumpingAttacking.new @ninja    
  end
  
  def fall
    @ninja.state = Falling.new @ninja
  end

  def animation
    @ninja.animations.jump
  end

  def update dt
    @ninja.jump dt
  end
  
end
