require_relative '../ninja'

describe Ninja do
  let(:image_width) { 46 }
  let(:image) { double 'Image', width: image_width }
  let(:ninja_animations) { double 'NinjaAnimations', current_image: image, stand: nil }
  let(:ninja) { Ninja.new ninja_animations }
  
  context 'drawing' do
    before do
      expect(ninja.animations).to receive(:current_image).and_return(image)      
    end

    it 'facing right' do
      expect(image).to receive(:draw).with(ninja.x, ninja.y, 1, 1)
      ninja.draw
    end

    it 'facing left' do
      ninja.facing = :left
      expect(image).to receive(:draw).with(ninja.x + image_width, ninja.y, 1, -1)
      ninja.draw
    end
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

  it 'can jump' do
    expect(ninja).to receive(:fall).exactly(0).times
    ninja.y = 325
    ninja.jump_pressed = true
    ninja.update(0.01)
    expect(ninja.y).to be < 325
  end

  it 'can jump?' do
    expect(ninja.jumping?).to be false
    ninja.y = 325
    expect(ninja.jumping?).to be true
  end

  
  
  context 'moving right' do
    it 'can move right' do
      expect(ninja.animations).to receive(:run_right)
      expect(ninja.x).to eq(100)
      ninja.right_pressed = true
      ninja.update(0.01)
      expect(ninja.x).to eq(102.4)
      expect(ninja.facing).to eq(:right)
    end
  end

  it 'can move left' do
    expect(ninja.animations).to receive(:run_left)
    expect(ninja.x).to eq(100)
    ninja.left_pressed = true
    ninja.update(0.01)
    expect(ninja.x).to eq(97.6)
    expect(ninja.facing).to eq(:left)
  end

  it 'stands' do
    expect(ninja.animations).to receive(:stand)
    ninja.update 0.01
  end
  
  
end
