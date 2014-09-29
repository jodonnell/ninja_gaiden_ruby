require_relative '../ninja'

describe Ninja do
  let(:window) { double 'Window' }
  let(:image) { double 'Image' }
  let(:ninja) { Ninja.new window }

  it "has a sprite" do
    allow(Gosu::Image).to receive_messages(:new => image)
    ninja = Ninja.create_with_sprite window
    expect(ninja.sprite).to be image
  end

  it 'can draw' do
    expect(ninja.sprite).to receive(:draw)
    ninja.draw
  end

  it 'is affected by gravity' do
    expect(ninja.y).to eq(100)
    ninja.update(1)
    expect(ninja.y).to eq(820)
  end
end
