require_relative '../../ninja_states/standing'

describe Standing do
  let(:ninja_animations) { double("NinjaAnimations") }
  let(:ninja) { double("Ninja", animations: ninja_animations) }
  let(:standing) { Standing.new ninja }
  
  it "right animation" do
    expect(ninja.animations).to receive(:stand)
    standing.animation
  end

  it "transitions to running right" do
    expect(ninja).to receive(:state=).with(an_instance_of(RunningRight))
    standing.right
  end

  it "transitions to running left" do
    expect(ninja).to receive(:state=).with(an_instance_of(RunningLeft))
    standing.left
  end
  it "transitions to running jump" do
    expect(ninja).to receive(:state=).with(an_instance_of(Jumping))
    standing.jump
  end
  it "transitions to attacking" do
    expect(ninja).to receive(:state=).with(an_instance_of(Attacking))
    standing.attack
  end
end
