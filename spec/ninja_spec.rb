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
  
  it 'falls' do
    expect(ninja.y).to eq(100)
    ninja.fall(0.01)
    expect(ninja.y).to eq(107.2)
  end

  it 'lands on the ground' do
    expect(ninja.y).to eq(100)
    ninja.update(5)
    expect(ninja.y).to eq(325)
  end

  it 'can jump' do
    ninja.y = 325
    ninja.jump(0.01)
    expect(ninja.y).to be < 325
  end

  it 'can move right' do
    expect(ninja.x).to eq(100)
    ninja.move_right(0.01)
    expect(ninja.x).to eq(102.4)
    expect(ninja.facing).to eq(:right)
  end


  it 'can move left' do
    expect(ninja.x).to eq(100)
    ninja.move_left(0.01)
    expect(ninja.x).to eq(97.6)
    expect(ninja.facing).to eq(:left)
  end
end
