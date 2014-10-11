require_relative '../../ninja_states/falling'

describe Falling do
  let(:ninja_animations) { double("NinjaAnimations") }
  let(:ninja) { double("Ninja", animations: ninja_animations) }
  let(:falling) { Falling.new ninja }
  
  it "right animation" do
    expect(ninja.animations).to receive(:falling)
    falling.animation
  end

  it "transitions to falling right" do
    expect(ninja).to receive(:state=).with(an_instance_of(FallingRight))
    falling.right
  end

  it "transitions to falling left" do
    expect(ninja).to receive(:state=).with(an_instance_of(FallingLeft))
    falling.left
  end
  
  it "transitions to falling attack" do
    expect(ninja).to receive(:state=).with(an_instance_of(FallingAttacking))
    falling.attack
  end
end
