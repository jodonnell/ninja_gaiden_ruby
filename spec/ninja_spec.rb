require_relative '../ninja'

describe Ninja do
  let(:ninja_animations) { double 'NinjaAnimations' }
  let(:ninja) { Ninja.new ninja_animations }
  let(:image) { double 'Image' }
  
  it 'can draw' do
    expect(ninja.animations).to receive(:current_image).and_return(image)
    expect(image).to receive(:draw).with(ninja.x, ninja.y, 1)
    ninja.draw
  end

  it 'is affected by gravity' do
    expect(ninja.y).to eq(100)
    ninja.update(0.01)
    expect(ninja.y).to eq(107.2)
  end

  it 'lands on the ground' do
    expect(ninja.y).to eq(100)
    ninja.update(5)
    expect(ninja.y).to eq(325)
  end

  context 'moving right' do
    it 'can move right' do
      expect(ninja.animations).to receive(:run_right).with(0.01)
      expect(ninja.x).to eq(100)
      ninja.right_pressed = true
      ninja.update(0.01)
      expect(ninja.x).to eq(102.4)
    end
  end

  it 'can move left' do
    expect(ninja.x).to eq(100)
    ninja.left_pressed = true
    ninja.update(0.01)
    expect(ninja.x).to eq(97.6)
  end

  
end
