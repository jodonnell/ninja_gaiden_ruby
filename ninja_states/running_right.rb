require './ninja_states/states'
require './ninja_states/jumping_right'
require './ninja_states/running_left'
require './ninja_states/standing'

class RunningRight < States
  def right
  end
  def left
    @ninja.state = RunningLeft.new @ninja    
  end

  def jump
    @ninja.state = JumpingRight.new @ninja
  end

  def crouch
  end

  def animation
    @ninja.animations.run_right
  end

  def no_right_or_left
    @ninja.state = Standing.new @ninja
  end
  
  def update dt
    @ninja.move_right dt
  end
end
