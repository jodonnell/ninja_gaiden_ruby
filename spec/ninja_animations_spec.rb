require_relative '../ninja'

describe NinjaAnimations do
  let(:window) { double 'Window' }
  let(:image) { double 'Image' }
  let(:ninja) { Ninja.new window }

  it "has a current image" do
    allow(Gosu::Image).to receive(:new).and_return(image)
    ninja = NinjaAnimations.new window
    expect(ninja.current_image).to be image
  end
end
