require_relative '../../ninja_states/crouching_attacking'

describe CrouchingAttacking do
  let(:ninja_animations) { double("NinjaAnimations") }
  let(:ninja) { double("Ninja", animations: ninja_animations) }
  let(:crouching_attacking) { CrouchingAttacking.new ninja }
  
  it "right animation" do
    expect(ninja.animations).to receive(:crouch_attacking)
    crouching_attacking.animation
  end

  it "transitions to running right" do
    expect(ninja).to receive(:state=).with(an_instance_of(RunningRight))
    crouching_attacking.right
  end

  it "transitions to running left" do
    expect(ninja).to receive(:state=).with(an_instance_of(RunningLeft))
    crouching_attacking.left
  end
  
  it "transitions to running jump" do
    expect(ninja).to receive(:state=).with(an_instance_of(Jumping))
    crouching_attacking.jump
  end

  it "transitions to crouching" do
    expect(ninja).to receive(:attack)
    crouching_attacking.update(2)
  end

  it "transitions to crouching" do
    expect(ninja).to receive(:state=).with(an_instance_of(Crouching))
    crouching_attacking.stop_attacking
  end

  
end
