require './ninja_states/states'
require './ninja_states/falling'
require './ninja_states/falling_right'
require './ninja_states/falling_left'
require './ninja_states/falling_attacking'
require './ninja_states/standing'

class Falling < States
  def right
    @ninja.state = FallingRight.new @ninja
  end

  def left
    @ninja.state = FallingLeft.new @ninja
  end

  def attack
    @ninja.state = FallingAttacking.new @ninja
  end
  
  def animation
    @ninja.animations.falling
  end

  def update dt
    @ninja.fall dt
  end
end
