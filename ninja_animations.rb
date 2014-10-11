require 'gosu'

class NinjaAnimations
  attr_accessor :images
  
  def initialize window
    init_images window
    @current_image = :standing
  end

  def init_images window
    @images = { standing: Gosu::Image.new(window, "images/ninja/ryu_stand.png", false),
                running1: Gosu::Image.new(window, "images/ninja/ryu_running_1.png", false),
                running2: Gosu::Image.new(window, "images/ninja/ryu_running_2.png", false),
                running3: Gosu::Image.new(window, "images/ninja/ryu_running_3.png", false),
                ducking: Gosu::Image.new(window, "images/ninja/ryu_ducking.png", false),
                jumping1: Gosu::Image.new(window, "images/ninja/ryu_right_jump.png", false),
                jumping2: Gosu::Image.new(window, "images/ninja/ryu_down_jump.png", false),
                jumping3: Gosu::Image.new(window, "images/ninja/ryu_left_jump.png", false),
                jumping4: Gosu::Image.new(window, "images/ninja/ryu_up_jump.png", false),
                attacking1: Gosu::Image.new(window, "images/ninja/ryu_attack_begin.png", false),
                attacking2: Gosu::Image.new(window, "images/ninja/ryu_attack_middle.png", false),
                attacking3: Gosu::Image.new(window, "images/ninja/ryu_attack_end.png", false),
                falling: Gosu::Image.new(window, "images/ninja/ryu_falling_attack_begin.png", false),
                fallingAttack1: Gosu::Image.new(window, "images/ninja/ryu_falling_attack_middle.png", false),
                fallingAttack2: Gosu::Image.new(window, "images/ninja/ryu_falling_attack_end.png", false),
                hurt: Gosu::Image.new(window, "images/ninja/ryu_hurt.png", false),
                duckingAttack1: Gosu::Image.new(window, "images/ninja/ryu_ducking_attack_begin.png", false),
                duckingAttack2: Gosu::Image.new(window, "images/ninja/ryu_ducking_attack_middle.png", false),
                duckingAttack3: Gosu::Image.new(window, "images/ninja/ryu_ducking_attack_end.png", false),
                climbing1: Gosu::Image.new(window, "images/ninja/ryu_climb.png", false),
                #climbing2: Gosu::Image.new(window, "images/ninja/ryu_climb_arms.png, false"),
              }

  end

  def current_image
    @images[@current_image]
  end
  
  def run_right
    if Gosu::milliseconds / 75 % 2 == 1
      @current_image = :running2
    else
      @current_image = :running1
    end
  end

  def run_left
    if Gosu::milliseconds / 75 % 2 == 1
      @current_image = :running2
    else
      @current_image = :running1
    end
  end
  
  def stand
    @current_image = :standing
  end

  def falling
    @current_image = :falling
  end
  
  def jump
    frame = Gosu::milliseconds / 50 % 4
    if frame == 0
      @current_image = :jumping1
    elsif frame == 1
      @current_image = :jumping2
    elsif frame == 2
      @current_image = :jumping3
    else
      @current_image = :jumping4
    end
  end

  def attack
    frame = Gosu::milliseconds / 100 % 3
    if frame == 0
      @current_image = :attacking1
    elsif frame == 1
      @current_image = :attacking2
    else
      @current_image = :attacking3
    end
  end

  def jump_attack
    frame = Gosu::milliseconds / 100 % 2
    if frame == 0
      @current_image = :fallingAttack1
    else
      @current_image = :fallingAttack2
    end
  end

end
