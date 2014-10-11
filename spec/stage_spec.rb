require_relative '../stage'

describe Ninja do
  let(:window) { double 'Window' }
  let(:image) { double 'Image' }
  let(:stage) { Stage.new image }

  it "has a sprite" do
    allow(CameraAwareImage).to receive_messages(:new => image)
    stage = Stage.create_with_sprite window
    expect(stage.image).to be image
  end

  it 'can draw' do
    expect(stage.image).to receive(:draw)
    stage.draw
  end
end
