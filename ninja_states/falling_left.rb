require './ninja_states/states'
require './ninja_states/falling'
require './ninja_states/falling_right'
require './ninja_states/falling_left_attacking'
require './ninja_states/standing'

class FallingLeft < States
  def right
    @ninja.state = FallingRight.new @ninja
  end

  def no_right_or_left
    @ninja.state = Falling.new @ninja
  end
  
  def attack
    @ninja.state = FallingLeftAttacking.new @ninja
  end

  def animation
    @ninja.animations.falling
  end

  def update dt
    @ninja.move_left dt
    @ninja.fall dt
  end
end
