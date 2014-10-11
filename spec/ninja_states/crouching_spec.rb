require_relative '../../ninja_states/crouching'

describe Crouching do
  let(:ninja_animations) { double("NinjaAnimations") }
  let(:ninja) { double("Ninja", animations: ninja_animations) }
  let(:crouching) { Crouching.new ninja }
  
  it "right animation" do
    expect(ninja.animations).to receive(:crouch)
    crouching.animation
  end

  it "transitions to running right" do
    expect(ninja).to receive(:state=).with(an_instance_of(RunningRight))
    crouching.right
  end

  it "transitions to running left" do
    expect(ninja).to receive(:state=).with(an_instance_of(RunningLeft))
    crouching.left
  end
  
  it "transitions to running jump" do
    expect(ninja).to receive(:state=).with(an_instance_of(Jumping))
    crouching.jump
  end
  
  it "transitions to attacking" do
    expect(ninja).to receive(:state=).with(an_instance_of(CrouchingAttacking))
    crouching.attack
  end

  it "transitions to standing" do
    expect(ninja).to receive(:state=).with(an_instance_of(Standing))
    crouching.stop_crouching
  end

end
