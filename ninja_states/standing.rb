require './ninja_states/states'
require './ninja_states/running_right'
require './ninja_states/running_left'
require './ninja_states/jumping'
require './ninja_states/attacking'
require './ninja_states/crouching'

class Standing < States
  def right
    @ninja.state = RunningRight.new @ninja
  end

  def left
    @ninja.state = RunningLeft.new @ninja
  end

  def jump
    @ninja.state = Jumping.new @ninja
  end

  def attack
    @ninja.state = Attacking.new @ninja
  end
  
  def crouch
    @ninja.state = Crouching.new @ninja
  end

  def animation
    @ninja.animations.stand
  end
end
