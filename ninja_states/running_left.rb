require './ninja_states/states'
require './ninja_states/jumping_left'
require './ninja_states/standing'
require './ninja_states/running_right'

class RunningLeft < States
  def right
    @ninja.state = RunningRight.new @ninja
  end

  def left

  end

  def jump
    @ninja.state = JumpingLeft.new @ninja    
  end

  def crouch

  end

  def no_right_or_left
    @ninja.state = Standing.new @ninja
  end
  
  def animation
    @ninja.animations.run_left
  end

  def update dt
    @ninja.move_left dt
  end
end
