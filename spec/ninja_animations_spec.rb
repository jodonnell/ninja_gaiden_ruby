require_relative '../ninja'

describe NinjaAnimations do
  let(:window) { double 'Window' }
  let(:image) { double 'Image' }
  let(:other_image) { double 'Image' }
  let(:ninja_animations) { NinjaAnimations.new window }

  before do
    allow(Gosu::Image).to receive(:new).and_return(image)
  end
  
  it "has a current image" do
    expect(ninja_animations.current_image).to be image
  end

  it "runs right" do
    ninja_animations.images[:running1] = other_image
    ninja_animations.run_right 0
    expect(ninja_animations.current_image).to be other_image
  end

  it "stands still" do
    ninja_animations.images[:standing] = other_image
    ninja_animations.stand 0
    expect(ninja_animations.current_image).to be other_image
  end

  
end
