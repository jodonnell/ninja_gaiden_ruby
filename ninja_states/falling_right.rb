require './ninja_states/states'
require './ninja_states/falling'
require './ninja_states/falling_left'
require './ninja_states/standing'
require './ninja_states/falling_right_attacking'

class FallingRight < States
  def left
    @ninja.state = FallingLeft.new @ninja
  end

  def no_right_or_left
    @ninja.state = Falling.new @ninja
  end

  def attack
    @ninja.state = FallingRightAttacking.new @ninja
  end
  
  def animation
    @ninja.animations.falling
  end

  def update dt
    @ninja.move_right dt
    @ninja.fall dt
  end
end
